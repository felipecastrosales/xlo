import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'constaints/constaints.dart'; // Here's my apiKey and my clientKey.

void main() async {
  runApp(MyApp());

  await Parse().initialize(
    keyApi,
    'https://parseapi.back4app.com/',
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );

  // final category = ParseObject('Categories')
  //   ..set<String>('Title', 'Meias')
  //   ..set<int>('Position', 1);
  // final response = await category.save();
  // print(response.success);

  // final category = ParseObject('Categories')
  //   ..objectId = 'ceR6RQFEcR'
  //   ..set<int>('Position', 3);
  // final response = await category.save();
  // print(response.success);

  // final category = ParseObject('Categories')
  //   ..objectId = 'ceR6RQFEcR';
  // category.delete();

  // final response = await ParseOject('Categories').getObject('6oeNq5lRxQ');
  // if (response.success) {
  //   print(response.result);
  // }

  // final response = await ParseOject('Categories').getAll();
  // if (response.success) {
  //   for (final object in response.result) {
  //     print(object);
  //   }
  // }

  final query = QueryBuilder(ParseObject('Categories'));
  query.whereContains('Title', 'Blusas');
  final response = await query.query();
  if (response.success) {
    print(response.result);
  }
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
