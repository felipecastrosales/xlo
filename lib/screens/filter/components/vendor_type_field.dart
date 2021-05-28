import 'package:flutter/material.dart';

import '../../../stores/filter_store.dart';
import 'section_title.dart';

class VendorTypeField extends StatelessWidget {
  final FilterStore filter;
  const VendorTypeField(this.filter);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle('Tipo de Aanunciante'),
      ],
    );
  }
}
