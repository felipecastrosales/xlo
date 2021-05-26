import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '../models/ad.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class AdRepository {
  Future<Ad> save(Ad ad) async {
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
      if (response.success) {
        return Ad.fromParse(response.result);
      } else {
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
