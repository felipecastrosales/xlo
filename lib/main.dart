import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'constaints/constaints.dart';

void main() async {
  runApp(MyApp());

  await Parse().initialize(
    keyApi,
    'https://parseapi.back4app.com/',
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );

  final category = ParseObject('Categorias')
    ..set('Title', 'Camisetas')
    ..set('Position', 2);
  final response = await category.save();
  print(response.success);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
