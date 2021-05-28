import 'package:flutter/material.dart';

import '../../stores/filter_store.dart';
import 'components/order_by_field.dart';
import 'components/price_range_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = FilterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtrar Busca')),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .85,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 32,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByField(filter),
                  PriceRangeField(filter),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}