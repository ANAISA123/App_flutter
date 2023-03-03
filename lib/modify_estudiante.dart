import 'package:app_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/text_box.dart';

class ModifyEstudiante extends StatefulWidget {
  final Estudiante _estudiante;
  ModifyEstudiante(this._estudiante);
  @override
  State<StatefulWidget> createState() => _ModifyEstudiante();
}

class _ModifyEstudiante extends State<ModifyEstudiante> {
  late TextEditingController controllerNombre;
  late TextEditingController controllerSemestre;
  late TextEditingController controllerEmail;

  @override
  void initState() {
    Estudiante c = widget._estudiante;
    controllerNombre = new TextEditingController(text: c.nombre);
    controllerSemestre = new TextEditingController(text: c.semestre);
    controllerEmail = new TextEditingController(text: c.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar información estudiante"),
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
              child: Text("Guardar cambios")),
        ],
      ),
    );
  }
}