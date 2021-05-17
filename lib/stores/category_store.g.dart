// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStoreBase, Store {
  Computed<List<Category>> _$allCategoryListComputed;

  @override
  List<Category> get allCategoryList => (_$allCategoryListComputed ??=
          Computed<List<Category>>(() => super.allCategoryList,
              name: '_CategoryStoreBase.allCategoryList'))
      .value;

  final _$errorAtom = Atom(name: '_CategoryStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_CategoryStoreBaseActionController =
      ActionController(name: '_CategoryStoreBase');

  @override
  void setCategories(List<Category> categories) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.setCategories');
    try {
      return super.setCategories(categories);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
allCategoryList: ${allCategoryList}
    ''';
  }
}
