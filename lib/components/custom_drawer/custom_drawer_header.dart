import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../screens/login/login_screen.dart';
import '../../stores/page_store.dart';
import '../../stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (userManagerStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => LoginScreen()));
        };
      },
      child: Container(
        color: Colors.purple,
        height: MediaQuery.of(context).size.height * .2,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(width: 8),
          Icon(
            Icons.person,
            color: Colors.grey[50],
            size: 42,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userManagerStore.isLoggedIn 
                      ? userManagerStore.user.name 
                      :  'Acesse sua conta agora!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  userManagerStore.isLoggedIn 
                      ? userManagerStore.user.email 
                      : 'Clique aqui',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
