class City {
  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'],
    name: json['nome'],
  );

  int id;
  String name;
  City({this.id, this.name});

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

}