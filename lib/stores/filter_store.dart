import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'home_store.dart';

part 'filter_store.g.dart';

// ignore: constant_identifier_names
enum OrderBy { DATE, PRICE }

// ignore: constant_identifier_names
const VENDOR_TYPE_PARTICULAR = 1 << 0;
// ignore: constant_identifier_names
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {

  _FilterStoreBase({
    this.orderBy = OrderBy.DATE, 
    this.minPrice, 
    this.maxPrice, 
    this.vendorType = VENDOR_TYPE_PARTICULAR,
  });

  @observable
  OrderBy orderBy;

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

  @observable
  int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;
  void setVendorType(int type)     => vendorType = vendorType | type;
  void resetVendorType(int type)   => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular   => (vendorType & VENDOR_TYPE_PARTICULAR)   != 0;
  bool get isTypeProfessional => (vendorType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    GetIt.I<HomeStore>().setFilter(this);
  }

  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      vendorType: vendorType,
    );
  }
}
