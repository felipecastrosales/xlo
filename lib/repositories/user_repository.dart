import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/user.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class UserRepository {
  // ignore: missing_return
  Future<void> signUp(User user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    final response = await parseUser.signUp();
    if (response.success) {
      print(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }
}
