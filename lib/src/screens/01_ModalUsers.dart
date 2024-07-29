import 'package:flutter/material.dart';
import 'package:flutter_application_api/src/controllers/consultarUsuarios.dart';

ModalEventos(BuildContext context) {
  consultarUsuarios().then((consultarUsuarios) {
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
            body: ListView.builder(
              itemCount: consultarUsuarios.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(consultarUsuarios[index].nombre),
                  subtitle: Text(consultarUsuarios[index].correo),
                  trailing: Icon(Icons.delete),
                );
              },
            ),
          );
        });
  });
}
