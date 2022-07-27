import 'dart:convert';
import 'dart:ffi';

class Person {
    Person({
        this.id,
        required this.cedula,
        required this.lastname,
        required this.name,
        this.telefono,
        required this.fechaNacimiento,
        this.cargasFamiliares,
        required this.discapacidad,
        this.porcentajeDiscapacidad
    });
     int? id;
    String cedula;
    String lastname;
    String name;
    String? telefono;
    DateTime fechaNacimiento;
    int? cargasFamiliares;
    Bool discapacidad;
    Float? porcentajeDiscapacidad;
  


factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Person.fromMap(Map<String, dynamic> json) => Person(
        id: json["id"],
        cedula: json["cedula"],
        lastname: json["lastname"],
        name: json["name"],
        telefono: json["telefono"],
        fechaNacimiento:json["fecha_nacimiento"],
        cargasFamiliares: json["cargas_familiares"],
        discapacidad: json ["discapacidad"],
        porcentajeDiscapacidad: json["porcentaje_discapacidad"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "cedula":cedula,
        "lastname": lastname,
        "name": name,
        "telefono": telefono,
        "fecha_nacimiento":fechaNacimiento,
        "cargas_familiares":cargasFamiliares,
        "discapacidad":discapacidad,
        "porcentaje_discapacidad":porcentajeDiscapacidad,
    };
}
