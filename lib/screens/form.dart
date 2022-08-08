import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/person.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  Person? person;
  FormScreen({super.key, this.person});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map<String, String> formValues = {
      "id": person?.id.toString() ?? "0",
      "dni": person?.dni.toString() ?? "",
      "name": person?.name.toString() ?? "",
      "lastname": person?.lastname.toString() ?? "",
      "contactNumber": person?.contactNumber.toString() ?? "",
      "birtday": person?.birthday.toString() ?? "",
      "familyBurdens": person?.familyBurdens.toString() ?? "",
      "disability": person?.familyBurdens.toString() ?? "",
      "disabilityPercent": person?.disabilityPercent.toString() ?? "",
    };
    print(person?.toMap());
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
                initialValue: formValues['dni'],
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.person),
                onChange: (value) {
                  formValues['dni'] = value ?? '';
                  print(formValues);
                },
              ),
              CustomTextFormField(
                helperText: 'Nombre',
                initialValue: formValues['name'],
                icon: const Icon(Icons.person),
                onChange: (value) {
                  formValues['name'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Apellido',
                initialValue: formValues['lastname'],
                icon: const Icon(Icons.person),
                onChange: (value) {
                  formValues['lastname'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Numero de contacto',
                initialValue: formValues['contactNumber'],
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.contact_page),
                onChange: (value) {
                  formValues['contactNumber'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Fecha de nacimiento',
                initialValue: formValues['birthday'],
                keyboardType: TextInputType.datetime,
                icon: const Icon(Icons.date_range),
                onChange: (value) {
                  formValues['birthday'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Cargas familiares',
                initialValue: formValues['familyBurdens'],
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.accessibility),
                onChange: (value) {
                  formValues['familyBurdens'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Discapacidad',
                initialValue: formValues['disability'],
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.accessibility),
                onChange: (value) {
                  formValues['disability'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Porcentaje Discapacidad',
                initialValue: formValues['disabilityPercent'],
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
