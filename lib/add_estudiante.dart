import 'package:app_crud_flutter/home_page.dart';
import 'package:app_crud_flutter/text_box.dart';
import 'package:flutter/material.dart';

class AddEstudiante extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddEstudiante();
}

class _AddEstudiante extends State<AddEstudiante> {
  late TextEditingController controllerNombre;
  late TextEditingController controllerSemestre;
  late TextEditingController controllerEmail;

  @override
  void initState() {
    controllerNombre = new TextEditingController();
    controllerSemestre = new TextEditingController();
    controllerEmail = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ingresar nuevo estudiante"),
        ),
        body: ListView(
          children: [
            TextBox(controllerNombre, "Nombre"),
            TextBox(controllerSemestre, "Semestre"),
            TextBox(controllerEmail, "Email"),
            ElevatedButton(
                onPressed: () {
                  String nombre = controllerNombre.text;
                  String semestre = controllerSemestre.text;
                  String email = controllerEmail.text;

                  if (nombre.isNotEmpty &&
                      semestre.isNotEmpty &&
                      email.isNotEmpty) {
                    Navigator.pop(
                        context,
                        new Estudiante(
                            nombre: nombre, semestre: semestre, email: email));
                  }
                },
                child: Text("Guardar estudiante"))
          ],
        ));
  }
}
