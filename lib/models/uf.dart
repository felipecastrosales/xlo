class UF {
  factory UF.fromJson(Map<String, dynamic> json) => UF(
    id: json['id'],
    initials: json['sigla'],
    name: json['nome'],
  );

  int id;
  String initials;
  String name;

  UF({this.id, this.initials, this.name});

  @override
  String toString() {
    return 'UF{id: $id, initials: $initials, name: $name}';
  }
}
