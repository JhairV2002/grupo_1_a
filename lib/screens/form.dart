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
      "lastname": person?.lastname.toString() ?? "",
      "name": person?.name.toString() ?? "",
      "contactNumber": person?.contactNumber ?? "",
      "birthday": person?.birthday.toString() ?? "",
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
          backgroundColor: const Color.fromARGB(255, 17, 14, 14),
          elevation: 0),
      backgroundColor: const Color.fromARGB(255, 23, 18, 18),
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
                icon: const Icon(
                  Icons.branding_watermark,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['dni'] = value ?? '';
                  print(formValues);
                },
              ),
              CustomTextFormField(
                helperText: 'Nombre',
                initialValue: formValues['name'],
                icon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['name'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Apellido',
                initialValue: formValues['lastname'],
                icon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['lastname'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Numero de contacto',
                initialValue: formValues['contactNumber'],
                keyboardType: TextInputType.number,
                icon: const Icon(
                  Icons.phone_android,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['contactNumber'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Fecha de nacimiento',
                initialValue: formValues['birthday'],
                keyboardType: TextInputType.datetime,
                icon: const Icon(
                  Icons.date_range,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['birthday'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Cargas familiares',
                initialValue: formValues['familyBurdens'],
                keyboardType: TextInputType.number,
                icon: const Icon(
                  Icons.family_restroom,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['familyBurdens'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Discapacidad',
                initialValue: formValues['disability'],
                keyboardType: TextInputType.number,
                icon: const Icon(
                  Icons.accessible,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  formValues['disability'] = value ?? '';
                },
              ),
              CustomTextFormField(
                helperText: 'Porcentaje Discapacidad',
                initialValue: formValues['disabilityPercent'],
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.sick,
                    color: Color.fromARGB(255, 30, 184, 34)),
                onChange: (value) {
                  formValues['disabilityPercent'] = value ?? '';
                },
              ),
              FloatingActionButton(
                  onPressed: () {
                    if (formValues['id'] != "0") {
                      personProvider.updatePerson(formValues);
                    } else {
                      personProvider.createPerson(formValues);
                    }
                  },
                  backgroundColor: const Color.fromARGB(255, 30, 184, 34),
                  child: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
