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
        backgroundColor: const Color.fromARGB(255, 23, 18, 18),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 23, 18, 18),
      body: Center(
        child: Card(
          color: const Color.fromARGB(255, 17, 14, 14),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.person_sharp,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                title: const Text('Modulo de Personas',
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text('Administre empleados, familiares, etc.',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/list-person');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.dynamic_form,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                title: const Text('Modulo de Personas',
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text('Administre empleados, familiares, etc.',
                    style: TextStyle(color: Colors.white)),
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
