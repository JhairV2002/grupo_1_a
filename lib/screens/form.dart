import 'package:flutter/material.dart';
import 'package:grupo_1_a/widgets/text_form_field.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text("Agregar persona"),
          backgroundColor: const Color.fromARGB(255, 23, 18, 18)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextFormField(
              autofocus: true,
              helperText: 'Dni',
              keyboardType: TextInputType.number,
              icon: const Icon(Icons.person),
            ),
            CustomTextFormField(
              helperText: 'Nombre',
              icon: const Icon(Icons.person),
            ),
            CustomTextFormField(
              helperText: 'Apellido',
              icon: const Icon(Icons.person),
            ),
            CustomTextFormField(
              helperText: 'Numero de contacto',
              keyboardType: TextInputType.number,
              icon: const Icon(Icons.contact_page),
            ),
            CustomTextFormField(
              helperText: 'Fecha de nacimiento',
              keyboardType: TextInputType.datetime,
              icon: const Icon(Icons.date_range),
            ),
            CustomTextFormField(
              helperText: 'Cargas familiares',
              keyboardType: TextInputType.number,
              icon: const Icon(Icons.accessibility),
            ),
            CustomTextFormField(
              helperText: 'Discapacidad',
              keyboardType: TextInputType.number,
              icon: const Icon(Icons.accessibility),
            ),
            CustomTextFormField(
              helperText: 'Discapacidad',
              keyboardType: TextInputType.number,
              icon: const Icon(Icons.accessibility),
            ),
            CustomTextFormField(
              helperText: 'Porcentaje Discapacidad',
              keyboardType: TextInputType.number,
              icon: const Icon(Icons.accessibility),
            ),
          ],
        ),
      ),
    );
  }
}
