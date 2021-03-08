// ignore: constant_identifier_names
enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });

  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'User{'
      'id: $id '
      'name: $name '
      'email: $email '
      'phone: $phone '
      'password: $password '
      'type: $type '
    '}';
  }
}
