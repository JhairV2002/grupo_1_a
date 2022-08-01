import 'dart:convert';

class Person {
  Person(
      {this.id,
      required this.dni,
      required this.lastname,
      required this.name,
      this.contactNumber,
      required this.birthday,
      this.familyBurdens,
      required this.disability,
      this.disabilityPercent});

  int? id;
  String dni;
  String lastname;
  String name;
  String? contactNumber;
  DateTime birthday;
  int? familyBurdens;
  bool disability;
  double? disabilityPercent;

  factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Person.fromMap(Map<String, dynamic> json) => Person(
        id: json["id"],
        dni: json["dni"],
        name: json["name"],
        lastname: json["lastname"],
        contactNumber: json["contact_number"],
        birthday: json["fecha_nacimiento"],
        familyBurdens: json["cargas_familiares"],
        disability: json["disability"],
        disabilityPercent: json["porcentaje_disability"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "dni": dni,
        "lastname": lastname,
        "name": name,
        "contact_number": contactNumber,
        "birthday": birthday,
        "family_burdens": familyBurdens,
        "disability": disability,
        "disability_percent": disabilityPercent,
      };
}
