import 'package:flutter/material.dart';
import 'package:flutter_application_api/src/screens/01_Home.dart';
import 'package:flutter_application_api/src/screens/02_inicioSesionUsuario.dart';
import 'package:flutter_application_api/src/screens/04_perfilUsuario.dart';
import 'package:flutter_application_api/src/screens/05_productos.dart';
import 'package:flutter_application_api/src/screens/06_MenuUser.dart';
import 'package:flutter_application_api/src/screens/07_category.dart';
import 'package:flutter_application_api/src/screens/3.1_RegistroUsuarios.dart';

class API extends StatelessWidget {
  const API({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API APP",
      home: HomePage(),
      // home: PaginaRegistro(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => Login(),
        '/registro': (context) => PaginadeRegistro(),
        '/perfil': (context) => Perfilusuario(),
        '/users': (context) => MenuUsers(),
        '/categories': (context) => CategoryPage(),
        '/products': (context) => ProductosPage()
      },
    );
  }
}
