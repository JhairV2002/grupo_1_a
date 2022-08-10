import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion Personas'),
        leading: const Icon(Icons.add_task_sharp),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(
            menuOptions[index].icon,
            color: AppTheme.primaryIcon,
          ),
          title: Text(menuOptions[index].name),
          onTap: () {
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length,
      ),
    );
  }
}
