import 'package:mobx/mobx.dart';

import '../models/user.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  @observable
  User user;

  // ignore: use_setters_to_change_properties
  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;
}
