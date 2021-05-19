import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/create_store.dart';
import '../../category/category_screen.dart';

class CategoryField extends StatelessWidget {
  final CreateStore createStore;
  const CategoryField(this.createStore);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            ListTile(
              title: createStore.category == null 
                  ? Text(
                      'Categoria *',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    )
                  : Text(
                      'Categoria *',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
              subtitle: createStore.category == null 
                  ? null : Text(
                    '${createStore.category.description}', 
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final category = await showDialog(
                  context: context,
                  builder: (_) => CategoryScreen(
                    showAll: false,
                    selected: createStore.category,
                  ),
                );
                if (category != null) {
                  createStore.setCategory(category);
                }
              },
            ),
            Observer(
              builder: (_) {
                if (createStore.categoryError != null) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.red)),
                    ),
                    child: Text(
                      createStore.categoryError, 
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  );
                } else { 
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[50])),
                    ),
                  ); 
                }
              },
            ),
          ],
        );
      },
    );
  }
}
