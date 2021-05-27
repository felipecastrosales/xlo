import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/screens/category/category_screen.dart';

import '../../../stores/home_store.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(
          builder: (_) {
            return BarButton(
              label: homeStore.category?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[400])),
              ),
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => 
                    CategoryScreen(showAll: true, selected: homeStore.category),
                  ),
                );
                if (category != null) {
                  return homeStore.setCategory(category);
                }
              },
            );
          },
        ),
        BarButton(
          label: 'Filtros',
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
              left: BorderSide(color: Colors.grey[400]),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
