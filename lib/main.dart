import 'package:flutter/material.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/screens/form.dart';
import 'package:grupo_1_a/screens/home.dart';
import 'package:grupo_1_a/screens/list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PersonProvider(),
          // child: Consumer<PersonProvider>(
          //     builder: ((context, value, child) => const MyApp())))
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/list-person': (context) => const ListPersonScreen(),
        '/form-person': (context) => const FormScreen()
      },
    );
  }
}
