import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

// ignore: constant_identifier_names
enum OrderBy { DATE, PRICE }

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  @observable
  OrderBy orderBy = OrderBy.DATE;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int minPrice;

  @action
  void setMinPrice(int value) => minPrice = value;

  @observable
  int maxPrice;

  @action
  void setMaxPrice(int value) => maxPrice = value;

  @computed
  String get priceError =>
      maxPrice != null && minPrice != null && maxPrice < minPrice 
        ? 'Faixa de Preço Inválido' : null;
}
