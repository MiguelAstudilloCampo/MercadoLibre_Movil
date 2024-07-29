import 'package:flutter_application_api/src/controllers/consultarUsuarios.dart';
import 'package:flutter/material.dart';

ModalUsuarios(BuildContext context) {
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
              title: Text('Usuarios'),
            ),
            body: ListView.builder(
              itemCount: consultarUsuarios.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4.0, // Controla la sombra debajo de la tarjeta
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Hace las esquinas redondeadas
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        consultarUsuarios[index]
                            .nombre[0], // Letra inicial del nombre
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      consultarUsuarios[index].nombre,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Correo: ${consultarUsuarios[index].correo}\nEdad: ${consultarUsuarios[index].edad}',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
          );
        });
  });
}
