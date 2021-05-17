import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../models/category.dart';
import '../../stores/category_store.dart';
import '../signup/components/error_box.dart';

class CategoryScreen extends StatelessWidget {
  final Category selected;
  final bool showAll;
  CategoryScreen({this.selected, this.showAll});

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * .85,
        padding: EdgeInsets.only(top: 12, bottom: 32),
        child: Card(
          elevation: 32,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Observer(
            builder: (_) {
              if (categoryStore.error != null) {
                return ErrorBox(message: categoryStore.error);
              } else if (categoryStore.categoryList.isEmpty) {
                return CircularProgressIndicator();
              } else {

              }
            }
          ),
        ),
      ),
    );
  }
}
