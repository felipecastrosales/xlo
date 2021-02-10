// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignUpStoreBase.nameValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpStoreBase.emailValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignUpStoreBase.phoneValid'))
          .value;
  Computed<bool> _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_SignUpStoreBase.passwordValid'))
          .value;
  Computed<bool> _$confirmPassValidComputed;

  @override
  bool get confirmPassValid => (_$confirmPassValidComputed ??= Computed<bool>(
          () => super.confirmPassValid,
          name: '_SignUpStoreBase.confirmPassValid'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStoreBase.isFormValid'))
          .value;

  final _$nameAtom = Atom(name: '_SignUpStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_SignUpStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPassAtom = Atom(name: '_SignUpStoreBase.confirmPass');

  @override
  String get confirmPass {
    _$confirmPassAtom.reportRead();
    return super.confirmPass;
  }

  @override
  set confirmPass(String value) {
    _$confirmPassAtom.reportWrite(value, super.confirmPass, () {
      super.confirmPass = value;
    });
  }

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPass(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setConfirmPass');
    try {
      return super.setConfirmPass(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
password: ${password},
confirmPass: ${confirmPass},
nameValid: ${nameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
passwordValid: ${passwordValid},
confirmPassValid: ${confirmPassValid},
isFormValid: ${isFormValid}
    ''';
  }
}
