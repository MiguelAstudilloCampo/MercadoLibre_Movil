import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Users>> consultarUsuarios() async {
  final response =
      await http.get(Uri.parse('https://api-js-d8yf.onrender.com/api/user'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

class Users {
  final String id; // Cambiado de correo a id para usar como identificador
  final String nombre;
  final int edad;
  final String correo;

  const Users({
    required this.id, // Añadido el campo id
    required this.nombre,
    required this.edad,
    required this.correo,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['_id'] ?? '',
      nombre: json['nombre'] ?? '',
      edad: json['edad'] ?? 0,
      correo: json['correo'] ?? '',
    );
  }
}

Future<Map<String, dynamic>> _registerUser(
    String nombre, String correo, String contrasenia, int edad) async {
  final url = Uri.parse('https://api-js-d8yf.onrender.com/api/user');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
      'correo': correo,
      'contrasenia': contrasenia,
      'edad': edad,
    }),
  );
  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to register user');
  }
}

Future<void> eliminarUsuario(String idUsuario) async {
  final response = await http.delete(
    Uri.parse('https://api-js-d8yf.onrender.com/api/user/$idUsuario'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    print('Usuario eliminado exitosamente');
  } else {
    print('Error al eliminar el usuario: ${response.body}');
    throw Exception('Error al eliminar el usuario');
  }
}

Future<void> updateUser(String idUsuario, String nombre, String correo) async {
  final url = Uri.parse('https://api-js-d8yf.onrender.com/api/user/$idUsuario');
  final response = await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
      'correo': correo,
    }),
  );

  if (response.statusCode == 200) {
    print('Usuario actualizado exitosamente');
  } else {
    print('Error al actualizar el usuario: ${response.body}');
    throw Exception('Error al actualizar el usuario');
  }
}
