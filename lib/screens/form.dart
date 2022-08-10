import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grupo_1_a/models/person.dart';
import 'package:grupo_1_a/providers/person_provider.dart';
import 'package:grupo_1_a/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  Person? person;

  FormScreen({super.key, this.person});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  // bool disability = false;

  changeState(value, String field) {
    if (widget.person != null) {
      setState(() {
        widget.person?.toMap()[field] = value;
      });
    } else {
      setState(() {
        formValues[field] = value ?? '';
        print(formValues);
      });
    }
  }

  Map<String, dynamic> formValues = {
    "id": "0",
    "dni": "",
    "lastname": "",
    "name": "",
    "contactNumber": "",
    "birthday": "",
    "familyBurdens": "",
    "disability": false,
    "disabilityPercent": "",
  };

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Agregar persona"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextFormField(
                autofocus: true,
                helperText: 'Dni',
                initialValue:
                    widget.person?.dni.toString() ?? formValues['dni'],
                keyboardType: TextInputType.number,
                icon: const Icon(
                  Icons.branding_watermark,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  if (widget.person != null) {
                    setState(() {
                      widget.person?.dni = value;
                    });
                    print(widget.person?.toMap());
                  } else {
                    setState(() {
                      formValues['dni'] = value ?? '';
                    });
                    print(formValues);
                  }
                },
              ),
              CustomTextFormField(
                helperText: 'Nombre',
                initialValue:
                    widget.person?.name.toString() ?? formValues['name'],
                icon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  if (widget.person != null) {
                    setState(() {
                      widget.person?.name = value;
                    });
                  } else {
                    setState(() {
                      formValues['name'] = value ?? '';
                    });
                  }
                },
              ),
              CustomTextFormField(
                helperText: 'Apellido',
                initialValue: widget.person?.lastname.toString() ??
                    formValues['lastname'],
                icon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  if (widget.person != null) {
                    setState(() {
                      widget.person?.lastname = value;
                    });
                  } else {
                    setState(() {
                      formValues['lastname'] = value ?? '';
                    });
                  }
                },
              ),
              CustomTextFormField(
                helperText: 'Numero de contacto',
                initialValue: widget.person?.contactNumber.toString() ??
                    formValues['contactNumber'],
                keyboardType: TextInputType.number,
                icon: const Icon(
                  Icons.phone_android,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  if (widget.person != null) {
                    setState(() {
                      widget.person?.contactNumber = value;
                    });
                  } else {
                    setState(() {
                      formValues['contactNumber'] = value ?? '';
                    });
                  }
                },
              ),
              CustomTextFormField(
                helperText: 'Fecha de nacimiento',
                initialValue: widget.person?.birthday.toString() ??
                    formValues['birthday'],
                keyboardType: TextInputType.datetime,
                icon: const Icon(
                  Icons.date_range,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  if (widget.person != null) {
                    setState(() {
                      widget.person?.birthday = value;
                    });
                  } else {
                    setState(() {
                      formValues['birthday'] = value ?? '';
                    });
                  }
                },
              ),
              CustomTextFormField(
                helperText: 'Cargas familiares',
                initialValue: widget.person?.familyBurdens.toString() ??
                    formValues['familyBurdens'].toString(),
                keyboardType: TextInputType.number,
                icon: const Icon(
                  Icons.family_restroom,
                  color: Color.fromARGB(255, 30, 184, 34),
                ),
                onChange: (value) {
                  if (widget.person?.familyBurdens != null) {
                    setState(() {
                      widget.person?.familyBurdens = int.parse(value!);
                    });
                  } else {
                    setState(() {
                      formValues['familyBurdens'] = value ?? '';
                    });
                  }
                },
              ),
              Checkbox(
                value: widget.person?.disability ?? formValues['disability'],
                onChanged: (value) {
                  if (widget.person?.disability != null) {
                    setState(() {
                      widget.person?.disability = value;
                    });
                  } else {
                    setState(() {
                      formValues['disability'] = value ?? false;
                    });
                  }
                },
              ),
              CustomTextFormField(
                helperText: 'Porcentaje Discapacidad',
                initialValue: widget.person?.disabilityPercent.toString() ??
                    formValues['disabilityPercent'].toString(),
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.sick,
                    color: Color.fromARGB(255, 30, 184, 34)),
                onChange: (value) {
                  if (widget.person?.disabilityPercent != null) {
                    setState(() {
                      widget.person?.disabilityPercent = value as double?;
                    });
                  } else {
                    setState(() {
                      formValues['disabilityPercent'] = value ?? 0.00;
                    });
                  }
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  print(formValues);
                  if (widget.person != null) {
                    personProvider.updatePerson(widget.person!.toMap());
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text("ACTUALIZO"),
                        content: Text("SE HA ACTUALIZADO EXITOSAMENTE"),
                      ),
                    );
                  } else {
                    personProvider.createPerson(formValues);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text("GUARDADO"),
                        content: Text("SE HA GUARDADO EXITOSAMENTE"),
                      ),
                    );
                  }
                },
                backgroundColor: const Color.fromARGB(255, 30, 184, 34),
                child: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
