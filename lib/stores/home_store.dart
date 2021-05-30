import 'package:mobx/mobx.dart';

import '../models/category.dart';
import '../repositories/ad_repository.dart';
import 'filter_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      final newAds = await AdRepository().getHomeAdList(
        filter: filter,
        search: search,
        category: category,
      );
      print(newAds);
    });
  }

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  FilterStore filter = FilterStore();

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(FilterStore value) => filter = value;
}
