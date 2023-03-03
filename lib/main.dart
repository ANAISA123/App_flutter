import 'package:app_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Firstpage(),
      color: Colors.green,
    );
  }
}

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 250.0,
            width: 350.0,
            child: Image.asset('assets/img_home.jpg'),
          ),
          MaterialButton(
            minWidth: 80.0,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home_Page("Directorio Estudiante")));
            },
            color: Colors.lightBlue,
            child: Text('Ingresar a la página principal',
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ),
        ],
      )),
    );
  }
}
