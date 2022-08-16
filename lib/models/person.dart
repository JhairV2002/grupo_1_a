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
  String? birthday;
  int? familyBurdens;
  bool? disability;
  double? disabilityPercent;
  bool? archived;

  Person.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    dni = json["dni"];
    name = json["name"];
    lastname = json["lastname"];
    contactNumber = json["contactNumber"];
    birthday = json["birthday"];
    familyBurdens = json["familyBurdens"];
    disability = json["disability"];
    disabilityPercent = json["disabilityPercent"];
    archived = json["archived"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "dni": dni,
        "lastname": lastname,
        "name": name,
        "contactNumber": contactNumber,
        "birthday": birthday,
        "familyBurdens": familyBurdens,
        "disability": disability,
        "disabilityPercent": disabilityPercent,
        "archived": archived
      };
}
