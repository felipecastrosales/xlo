import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '../models/ad.dart';
import '../models/category.dart';
import '../models/user.dart';
import '../stores/filter_store.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class AdRepository {
  Future<List<Ad>> getHomeAdList({
    FilterStore filter,
    String search,
    Category category,
  }) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));
    queryBuilder.includeObject([keyAdOwner, keyAdCategory]);
    queryBuilder.setLimit(20);
    queryBuilder.whereEqualTo(keyAdStatus, AdStatus.ACTIVE.index);
    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyAdTitle, search, caseSensitive: false);
    }
    if (category != null && category.id != '*') {
      queryBuilder.whereEqualTo(
        keyAdCategory, 
        (ParseObject(keyCategoryTable)
            ..set(keyCategoryId, category.id)).toPointer());
    }
    switch (filter.orderBy) {
      case OrderBy.PRICE:
        queryBuilder.orderByAscending(keyAdPrice);
        break;
      case OrderBy.DATE:
      default:
        queryBuilder.orderByDescending(keyAdCreatedAt);
        break;
    }
    if (filter.minPrice != null && filter.minPrice > 0) {
      queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
    }
    if (filter.maxPrice != null && filter.maxPrice > 0) {
      queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
    }
    if (filter.vendorType != null &&
        filter.vendorType > 0 &&
        filter.vendorType < (VENDOR_TYPE_PROFESSIONAL | VENDOR_TYPE_PARTICULAR)
    ) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());
      if (filter.vendorType == VENDOR_TYPE_PARTICULAR) {
        userQuery.whereEqualTo(keyUserType, UserType.PARTICULAR.index);
      }
      if (filter.vendorType == VENDOR_TYPE_PROFESSIONAL) {
        userQuery.whereEqualTo(keyUserType, UserType.PROFESSIONAL.index);
      }
      queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
    }
    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results.map((pObj) => Ad.fromParse(pObj)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images);
      final parseUser = ParseUser('', '', '')..set(keyUserId, ad.category.id);
      final adObject = ParseObject(keyAdTable);
      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseAcl);
      adObject.set<ParseUser>(keyAdOwner, parseUser);
      adObject.set<List<ParseFile>>(keyAdImages, parseImages);
      adObject.set<String>(keyAdTitle, ad.title);
      adObject.set<String>(keyAdDescription, ad.description);
      adObject.set<ParseObject>(keyAdCategory, ParseObject(keyCategoryTable)
          ..set(keyCategoryId, ad.category.id));
      adObject.set<String>(keyAdPostalCode, ad.address.cep);
      adObject.set<String>(keyAdDistrict, ad.address.district);
      adObject.set<String>(keyAdCity, ad.address.city.name);
      adObject.set<String>(keyAdFederativeUnit, ad.address.uf.initials);
      adObject.set<num>(keyAdPrice, ad.price);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone);
      adObject.set<int>(keyAdStatus, ad.status.index);

      final response = await adObject.save();
      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar anúncio.');
    }
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];
    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
              ParseErrors.getDescription(response.error.code),
            );
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }
      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar imagem');
    }
  }
}
