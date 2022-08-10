import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/menu_option.dart';
import 'package:grupo_1_a/screens/screens.dart';

class AppRoutes {
  static const initialRoute = '/';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        icon: Icons.home,
        name: 'Home Screen',
        screen: const HomeScreen()),
    MenuOption(
        route: 'user-list',
        icon: Icons.list,
        name: 'User List',
        screen: const ListPersonScreen()),
    MenuOption(
        route: 'user-form',
        icon: Icons.people,
        name: 'User Form',
        screen: FormScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    for (final menuOption in menuOptions) {
      routes.addAll(
          {menuOption.route: (BuildContext context) => menuOption.screen});
    }
    return routes;
  }
}
