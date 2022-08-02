class Person {
  Person(
      {this.id,
      this.dni,
      this.lastname,
      this.name,
      this.contactNumber,
      this.birthday,
      this.familyBurdens,
      this.disability,
      this.disabilityPercent});

  int? id;
  String? dni;
  String? lastname;
  String? name;
  String? contactNumber;
  DateTime? birthday;
  int? familyBurdens;
  bool? disability;
  double? disabilityPercent;

  Person.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    dni = json["dni"];
    name = json["name"];
    lastname = json["lastname"];
    contactNumber = json["contact_number"];
    birthday = json["fecha_nacimiento"];
    familyBurdens = json["cargas_familiares"];
    disability = json["disability"];
    disabilityPercent = json["porcentaje_disability"];
  }

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
