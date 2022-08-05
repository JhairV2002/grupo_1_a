import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/person.dart';
import 'package:http/http.dart' as http;

class PersonProvider with ChangeNotifier {
  final List<Person> persons = [];
  final String url = 'http://localhost:8080/person/findAll';

  Future<List<Person>> getPersons() async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    List<dynamic> responseBody = await jsonDecode(response.body);

    responseBody.forEach((el) {
      final currentPerson = Person.fromJson(el);
      persons.removeWhere((element) => currentPerson.id == element.id);
      persons.add(currentPerson);
    });

    return persons;
  }
}
