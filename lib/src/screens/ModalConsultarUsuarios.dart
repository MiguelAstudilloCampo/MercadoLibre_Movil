import 'package:flutter/material.dart';
import 'package:flutter_application_api/src/controllers/consultarUsuarios.dart';

ModalUsuarios(BuildContext context) {
  consultarUsuarios().then((usuarios) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[100],
            title: Text('Usuarios'),
          ),
          body: ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (BuildContext context, int index) {
              final user = usuarios[index];
              return Card(
                elevation: 4.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      user.nombre[0].toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    user.nombre,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Correo: ${user.correo}\nEdad: ${user.edad}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.update),
                        onPressed: () {
                          _showActualizarUsuario(context, user, () {
                            _refreshUserList(context);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showEliminarUsuario(
                            context,
                            user.id,
                            () async {
                              await eliminarUsuario(user.id);
                              _refreshUserList(context);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  });
}

void _showEliminarUsuario(
    BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Eliminar usuario'),
        content: Text('¿Estás seguro de eliminar el usuario?'),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Eliminar'),
            onPressed: () {
              Navigator.of(context).pop();
              onDeleteConfirmed();
            },
          ),
        ],
      );
    },
  );
}

void _refreshUserList(BuildContext context) async {
  final usuarios = await consultarUsuarios();
  Navigator.of(context).pop(); // Cierra el modal actual
  ModalUsuarios(context); // Vuelve a abrir el modal con la lista actualizada
}

void _showActualizarUsuario(
    BuildContext context, Users user, VoidCallback onUserUpdated) {
  TextEditingController nameController =
      TextEditingController(text: user.nombre);
  TextEditingController emailController =
      TextEditingController(text: user.correo);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Actualizar usuario'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Correo"),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Actualizar'),
            onPressed: () {
              String nombre = nameController.text;
              String correo = emailController.text;

              if (nombre.isNotEmpty && correo.isNotEmpty) {
                updateUser(user.id, nombre, correo).then((updatedUser) {
                  Navigator.of(context).pop();
                  onUserUpdated();
                }).catchError((error) {
                  print(error);
                  Navigator.of(context).pop();
                });
              } else {
                print('No se han ingresado datos');
              }
            },
          ),
        ],
      );
    },
  );
}
