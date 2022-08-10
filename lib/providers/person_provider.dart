import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/person.dart';
import 'package:http/http.dart' as http;

class PersonProvider with ChangeNotifier {
  final List<Person> persons = [];
  String uri = 'http://localhost:8080/person';

  Future<List<Person>> getPersons() async {
    var url = Uri.parse("$uri/findAll");
    var response = await http.get(url);
    List<dynamic> responseBody = await jsonDecode(response.body);

    responseBody.forEach((el) {
      final currentPerson = Person.fromJson(el);
      persons.removeWhere((element) => currentPerson.id == element.id);
      persons.add(currentPerson);
      persons.sort(((a, b) => a.id!.compareTo(b.id!)));
    });

    return persons;
  }

  Future createPerson(Map<String, dynamic> body) async {
    var url = Uri.parse("$uri/save");
    var response = await http.post(url,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    print(response);
  }

  Future updatePerson(Map<String, dynamic> body) async {
    var url = Uri.parse("$uri/update");
    var response = await http.put(url,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    print(response);
  }

  Future<Person> getPersonById(id) async {
    String url = 'http://localhost:8080/person/findById/$id';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var resposeBody = await jsonDecode(response.body);
    Person person = Person.fromJson(resposeBody);

    return person;
  }
}
