import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/person.dart';
import 'package:http/http.dart' as http;

class PersonProvider with ChangeNotifier {
  final List<Person> persons = [];
  final String url = 'localhost:8080';
  PersonProvider() {
    getPersons();
  }

  getPersons() async {
    var uri = Uri.http(url, '/person/findAll');
    var response = await http.get(uri);
    var responseBody = await jsonDecode(response.body);

    await responseBody.forEach((el) => persons.add(Person.fromMap(el)));
    notifyListeners();
    return persons;
  }
}
