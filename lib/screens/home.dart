import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grupo_1_a/themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion Personas',
            style: TextStyle(
              fontSize: 24,
            )),
        centerTitle: true,
        leading: const Icon(
          Icons.abc,
          color: AppTheme.secondary,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  'person-244.svg',
                  color: AppTheme.primaryIcon,
                  height: 200,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: const ListTileTheme(
                    tileColor: Color.fromARGB(255, 58, 191, 248),
                    contentPadding: EdgeInsets.all(10),
                    iconColor: Colors.white,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      leading: Icon(
                        Icons.info,
                        size: 30,
                      ),
                      title: Text(
                        "Info.",
                        style: TextStyle(fontSize: 18, color: AppTheme.primary),
                      ),
                      subtitle: Text(
                        "Registre, actualice o elimine de su catalogo de contactos, personas o empleados",
                        style: TextStyle(fontSize: 14, color: AppTheme.primary),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: AppTheme.primary, spreadRadius: 5)
                      ]),
                  width: 150,
                  child: Column(children: [
                    const Icon(Icons.list, size: 40),
                    const Text(
                      "Lista de personas registradas",
                      textAlign: TextAlign.center,
                    ),
                    GFButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/list-person');
                      },
                      color: AppTheme.primaryIcon,
                      child: const Text(
                        "Ir",
                        style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: AppTheme.primary, spreadRadius: 5)
                      ]),
                  width: 150,
                  child: Column(children: [
                    const Icon(Icons.person_add,
                        size: 40, color: Color.fromARGB(255, 217, 147, 48)),
                    const Text(
                      "Añadir una nueva persona",
                      textAlign: TextAlign.center,
                    ),
                    GFButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/form-person');
                      },
                      color: Color.fromARGB(255, 217, 147, 48),
                      child: const Text(
                        "Ir",
                        style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
