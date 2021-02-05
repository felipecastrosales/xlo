import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: MediaQuery.of(context).size.height * .2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 8),
          Icon(
            Icons.person, 
            color: Colors.grey[50], 
            size: 42,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Acesse sua conta agora!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500, 
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Clique aqui',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500, 
                  ),
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}