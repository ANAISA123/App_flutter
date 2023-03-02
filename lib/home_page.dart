import 'package:app_crud_flutter/add_product.dart';
import 'package:app_crud_flutter/message_response.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/modify_product.dart';

class Home_Page extends StatefulWidget {
  final String _title;
  Home_Page(this._title);
  @override
  State<StatefulWidget> createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page> {
  List<Estudiante> estudiantes = [
    Estudiante(
        nombre: 'Juan Esteban Duque',
        semestre: '6',
        email: 'juanes123@gmail.com')
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: ListView.builder(
          itemCount: estudiantes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyEstudiante(estudiantes[index])))
                    .then((newEstudiante) {
                  if (newEstudiante != null) {
                    setState(() {
                      estudiantes.removeAt(index);

                      estudiantes.insert(index, newEstudiante);

                      messageResponse(
                          context, newEstudiante.nombre + " ha sido modificado...!");
                    });
                  }
                });
              },
              onLongPress: () {
                removeEstudiante(context, estudiantes[index]);
              },
              title: Text(estudiantes[index].nombre),
              subtitle: Text("Semestre: " + estudiantes[index].semestre +
                  " - " +
                  estudiantes[index].email),
              leading: Card(
                child: Text(estudiantes[index].nombre.substring(0, 1)),
              ),
              trailing: Icon(
                Icons.emoji_events,
                color: Colors.lightBlue,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddEstudiante()))
                .then((newEstudiante) {
              if (newEstudiante != null) {
                setState(() {
                  estudiantes.add(newEstudiante);
                  messageResponse(context,
                      newEstudiante.nombre + "ha sido ingresado con exito!...");
                });
              }
            });
          },
          tooltip: "Agregar Estudiante",
          child: Icon(Icons.add),
        ));
  }

  removeEstudiante(BuildContext context, Estudiante estudiante) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar estudiante"),
              content: Text("Esta seguro de eliminar a " + estudiante.nombre + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.estudiantes.remove(estudiante);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Color.fromARGB(255, 243, 212, 33)),
                  ),
                )
              ],
            ));
  }
}

class Estudiante {
  var nombre;
  var semestre;
  var email;

  Estudiante({this.nombre, this.semestre, this.email});
}
