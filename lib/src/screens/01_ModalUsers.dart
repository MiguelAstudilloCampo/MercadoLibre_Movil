import 'package:flutter/material.dart';
import 'package:flutter_application_api/src/controllers/consultarUsuarios.dart';

ModalEventos(BuildContext context) {
  final consultaUsuarios = consultarUsuarios();
  print(consultaUsuarios);

  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.event),
              )
            ],
            backgroundColor: Colors.red[100],
            title: Text("Usuarios"),
          ),
          body: Center(
            child: Text("Hola"),
          ),
        );
      });
}
