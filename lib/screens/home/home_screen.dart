import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import '../../stores/home_store.dart';
import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(currentSearch: homeStore.search),
    );
    if (search != null) {
      homeStore.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (homeStore.search.isEmpty) {
                return Container();
              }
              return GestureDetector(
                onTap: () => openSearch(context),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      child: Text(homeStore.search),
                    );
                  },
                ),
              );
            },
          ),
          actions: [
            Observer(
              builder: (_) {
                if (homeStore.search.isEmpty) {
                  return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      openSearch(context);
                    },
                  );
                }
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    homeStore.setSearch('');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
