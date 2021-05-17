import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../repositories/table_keys.dart';

class Category {
  final String id;
  final String description;
  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(keyCategoryDescription);

  Category({this.id, this.description});

  @override
  String toString() {
    return 'Category{id: $id, description: $description}';
  }
}
