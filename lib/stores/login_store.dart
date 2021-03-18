import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../helpers/extensions.dart';
import '../repositories/user_repository.dart';
import 'user_manager_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email;

  // ignore: use_setters_to_change_properties
  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError =>
      email == null || emailValid ? null : 'E-mail Inválido';

  @observable
  String password;

  // ignore: use_setters_to_change_properties
  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 4;
  String get passwordError =>
      password == null || passwordValid ? null : 'Senha Inválida';

  @computed
  Function get loginPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(user);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
