import 'package:flutter/material.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/screens/form.dart';
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
    personProvider.getPersons().then((res) => print(res.first.toMap()));
  }

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Personas'),
        ),
        // body: Column(
        //   children: [

        body: ListView.builder(
            // separatorBuilder: (_, __) => const Divider(),
            itemCount: personProvider.persons.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: const Icon(
                  Icons.person_sharp,
                ),
                title: Text(
                  '${personProvider.persons[i].name!} ${personProvider.persons[i].lastname!}',
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
