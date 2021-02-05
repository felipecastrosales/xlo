import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'page_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(75),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .75,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
