import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion Personas'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      body: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.person_sharp,
                ),
                title: const Text(
                  'Lista de Personas',
                ),
                subtitle: const Text(
                  'Administre empleados, familiares, etc.',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/list-person');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.dynamic_form,
                ),
                title: const Text(
                  'Formulario',
                ),
                subtitle: const Text(
                  'Cree empleados, familiares, etc.',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/form-person');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
