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
    "disabilityPercent": "0.00",
    "archived": false
  };

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    deletePerson() {
      widget.person!.archived = true;
      personProvider.updatePerson(widget.person!.toMap());
      Navigator.pushNamed(context, '/');
      final snackBar = SnackBar(
          content: const Text('Persona eliminada'),
          action: SnackBarAction(
            label: 'ok',
            onPressed: () {},
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    final AlertDialog dialog = AlertDialog(
      title: const Text('¿Desea eliminar este registro?'),
      content:
          const Text('El registro se eliminará de la lista mas no de la base.'),
      actions: [
        FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.close),
        ),
        FloatingActionButton(
          onPressed: () => deletePerson(),
          child: const Icon(Icons.check),
        ),
      ],
    );
    showDeleteButton() {
      final snackBar = SnackBar(
        content: const Text('Persona Registrada!'),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      if (widget.person != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => dialog);
              },
              backgroundColor: const Color.fromARGB(255, 248, 114, 114),
              child: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 71, 0, 0),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                print(widget.person!.toMap());
                Navigator.pushNamed(context, '/');
                personProvider.updatePerson(widget.person!.toMap());
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              backgroundColor: const Color.fromARGB(255, 30, 184, 34),
              child: const Icon(
                Icons.save,
                color: Colors.black,
              ),
            ),
          ],
        );
      } else {
        return FloatingActionButton(
          onPressed: () {
            personProvider.createPerson(formValues);
            Navigator.pushNamed(context, '/');
            print(formValues);
            final snackBar = SnackBar(
              content: const Text('Persona Registrada!'),
              action: SnackBarAction(
                label: 'ok',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          backgroundColor: const Color.fromARGB(255, 30, 184, 34),
          child: const Icon(
            Icons.save,
            color: Colors.black,
          ),
        );
      }
    }

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
                  if (widget.person != null) {
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
              CheckboxListTile(
                checkColor: const Color.fromARGB(255, 0, 0, 0),
                activeColor: const Color.fromARGB(255, 40, 224, 46),
                title: const Text('Discapacidad'),
                value: widget.person?.disability ?? formValues['disability'],
                onChanged: (value) {
                  if (widget.person?.disability != null) {
                    setState(
                      () {
                        widget.person?.disability = value;
                      },
                    );
                  } else {
                    setState(
                      () {
                        formValues['disability'] = value ?? false;
                      },
                    );
                  }
                },
              ),
              CheckboxListTile(
                checkColor: const Color.fromARGB(255, 0, 0, 0),
                activeColor: const Color.fromARGB(255, 40, 224, 46),
                title: const Text('Archivado'),
                value: widget.person?.archived ?? formValues['archived'],
                onChanged: (value) {
                  if (widget.person?.archived != null) {
                    setState(
                      () {
                        widget.person?.archived = value;
                      },
                    );
                  } else {
                    setState(
                      () {
                        formValues['archived'] = value ?? false;
                      },
                    );
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
                      widget.person?.disabilityPercent = double.parse(value!);
                    });
                  } else {
                    setState(() {
                      formValues['disabilityPercent'] = value ?? 0.00;
                    });
                  }
                },
              ),
              showDeleteButton()!,
            ],
          ),
        ),
      ),
    );
  }
}
