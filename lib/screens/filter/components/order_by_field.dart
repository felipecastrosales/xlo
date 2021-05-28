import 'package:flutter/material.dart';

import 'section_title.dart';

class OrderByField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(title, style: TextStyle(color: Colors.white)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordenar por'),
        Row(
          children: [
            buildOption('Data'),
            const SizedBox(width: 12),
            buildOption('Preço'),
          ],
        ),
      ],
    );
  }
}
