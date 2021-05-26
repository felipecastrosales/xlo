import 'package:flutter/material.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context, builder: (_) => SearchDialog(currentSearch: 'Opa!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                openSearch(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
