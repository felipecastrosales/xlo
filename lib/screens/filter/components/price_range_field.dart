import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'price_field.dart';
import 'section_title.dart';

class PriceRangeField extends StatelessWidget {
  final FilterStore filter;
  const PriceRangeField(this.filter);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Preço'),
        Row(
          children: [
            PriceField(
              label: 'Min',
              onChanged: filter.setMinPrice,
              initialValue: filter.minPrice,
            ),
            const SizedBox(width: 12),
            PriceField(
              label: 'Max',
              onChanged: filter.setMaxPrice,
              initialValue: filter.maxPrice,
            ),
          ],
        ),
        Observer(
          builder: (_) {
            if (filter.priceError != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  filter.priceError, 
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
