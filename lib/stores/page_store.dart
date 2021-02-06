import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase with Store {
  @observable
  int page = 0;

  // ignore: use_setters_to_change_properties
  @action 
  void setPage(int value) => page = value;
}
