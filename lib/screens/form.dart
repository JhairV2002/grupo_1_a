import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/person.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  Person? person;
  FormScreen({super.key, this.person});

  Map<String, String> formValues = {
    "id": "0",
    "dni": "",
    "name": "",
    "lastname": "",
    "contactNumber": "",
    "birtday": "",
    "familyBurdens": "",
    "disability": "",
    "disabilityPercent": "",
  };
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text("Agregar persona"),
          backgroundColor: const Color.fromARGB(255, 23, 18, 18)),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextFormField(
                autofocus: true,
                helperText: 'Dni',
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.person),
                onChange: (value) {
                  formValues['dni'] = value ?? '';
                  print(formValues);
                },
              ),
              CustomTextFormField(
                helperText: 'Nombre',
                icon: const Icon(Icons.person),
                onChange: (value) {
                  formValues['name'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Apellido',
                icon: const Icon(Icons.person),
                onChange: (value) {
                  formValues['lastname'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Numero de contacto',
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.contact_page),
                onChange: (value) {
                  formValues['contactNumber'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Fecha de nacimiento',
                keyboardType: TextInputType.datetime,
                icon: const Icon(Icons.date_range),
                onChange: (value) {
                  formValues['birthday'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Cargas familiares',
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.accessibility),
                onChange: (value) {
                  formValues['familyBurdens'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Discapacidad',
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.accessibility),
                onChange: (value) {
                  formValues['disability'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Porcentaje Discapacidad',
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.accessibility),
                onChange: (value) {
                  formValues['disabilityPercent'] = value ?? '';
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  personProvider.createPerson(formValues);
                },
                child: const Icon(Icons.save),
              )
            ],
          ),
        ),
      ),
    );
  }
}
