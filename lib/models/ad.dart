import 'address.dart';
import 'category.dart';
import 'user.dart';

// ignore: constant_identifier_names
enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  String id;
  List images;
  String title;
  String description;
  Category category;
  Address address;
  num price;
  bool hidePhone;
  AdStatus status = AdStatus.PENDING;
  DateTime created;
  User user;
  int views;
}
