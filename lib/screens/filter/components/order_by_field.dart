import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'section_title.dart';

class OrderByField extends StatelessWidget {
  final FilterStore filter;
  const OrderByField(this.filter);

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy option) {
      final order = filter.orderBy == option;
      return GestureDetector(
        onTap: () {
          filter.setOrderBy(option);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: order ? Colors.purple : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: order ? Colors.purple : Colors.blueGrey),
          ),
          child: Text(
            title,
            style: TextStyle(color: order ? Colors.white : Colors.black),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordenar por'),
        Observer(
          builder: (_) {
            return Row(
              children: [
                buildOption('Data', OrderBy.DATE),
                const SizedBox(width: 12),
                buildOption('Preço', OrderBy.PRICE),
              ],
            );
          },
        ),
      ],
    );
  }
}
