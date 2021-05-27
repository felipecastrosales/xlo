import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title, 
        style: TextStyle(
          color: Colors.purple, fontSize: 13, fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}