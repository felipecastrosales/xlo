import 'package:mobx/mobx.dart';

import '../helpers/extensions.dart';

part 'signup_store.g.dart';


class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  String name;

  // ignore: use_setters_to_change_properties
  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length >= 6;
  String get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @observable
  String email;

  // ignore: use_setters_to_change_properties
  @action
  void setEmail(String value) => email = value;

  @computed 
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  } 

  @observable
  String phone;

  // ignore: use_setters_to_change_properties
  @action
  void setPhone(String value) => phone = value;

  @computed 
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Número inválido';
    }
  } 

  @observable
  String password;

  // ignore: use_setters_to_change_properties
  @action
  void setPassword(String value) => password = value;

  @computed 
  bool get passwordValid => password != null && password.length >= 6;
  String get passwordError {
    if (password == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha inválida';
    }
  } 

  @observable
  String confirmPass;

  // ignore: use_setters_to_change_properties
  @action
  void setConfirmPass(String value) => confirmPass = value;

  @computed 
  bool get confirmPassValid => confirmPass != null && confirmPass == password;
  String get confirmPassError {
    if (confirmPass == null || confirmPassValid) {
      return null;
    } else {
      return 'Senha não coincidem';
    }
  } 
}
