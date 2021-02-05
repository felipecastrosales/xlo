import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {

  PageTile({this.label, this.iconData, this.onTap, this.highlight});
  
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: highlight ? Colors.purple : Colors.grey[800],
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: Icon(
        iconData, 
        color: highlight ? Colors.purple : Colors.grey[800],
      ),
      onTap: onTap,
    );
  }
}