import 'package:flutter/material.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/themes/theme.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      title: 'Person App',
      initialRoute: ('/'),
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
