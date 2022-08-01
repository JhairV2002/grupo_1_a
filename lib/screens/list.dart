import 'package:flutter/material.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
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
    final userProvider = Provider.of<PersonProvider>(context, listen: false);
    print(userProvider.persons);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Lista de personas'),
      ),
    );
  }
}
