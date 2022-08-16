import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/screens/form.dart';
import 'package:grupo_1_a/themes/theme.dart';
import 'package:provider/provider.dart';

class ListPersonScreen extends StatefulWidget {
  const ListPersonScreen({super.key});
  @override
  _ListPersonScreenState createState() => _ListPersonScreenState();
}

class _ListPersonScreenState extends State<ListPersonScreen> {
  @override
  void initState() {
    super.initState();
    final personProvider = Provider.of<PersonProvider>(context, listen: false);
    Future<List> listPersons = personProvider.getPersons();
  }

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personas'),
        ),
        // body: Column(
        //   children: [

        body: ListView.builder(
            //separatorBuilder: (_, __) => const Divider(),
            itemCount: personProvider.persons.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: const Icon(
                  Icons.person_sharp,
                ),
                title: Text(
                  '${personProvider.persons[i].name!} ${personProvider.persons[i].lastname!}',
                ),
                subtitle: Text(
                  '${personProvider.persons[i].dni ?? "Cedula no registrada"} - ${personProvider.persons[i].contactNumber ?? "Numero no registrado"}',
                  style: const TextStyle(
                      color: Color.fromARGB(111, 255, 255, 255)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FormScreen(person: personProvider.persons[i])));
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/form-person');
            })
        //],
        //  ),
        );
  }
}
