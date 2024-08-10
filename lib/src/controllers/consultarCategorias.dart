/// Ver Categorias

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Categorie>> consultarCategoria() async {
  final response = await http
      .get(Uri.parse('https://api-js-d8yf.onrender.com/api/categorie'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Categorie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}

class Categorie {
  final String id;
  final String nombre;

  const Categorie({
    required this.id,
    required this.nombre,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'] ?? '',
      nombre: json['nombre'] ?? '',
    );
  }
}

/// Registrar Categorias

Future<Map<String, dynamic>> _registerCategory(String nombre) async {
  final url = Uri.parse('https://api-js-d8yf.onrender.com/api/categorie');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
    }),
  );
  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to register category');
  }
}

Future<void> eliminarCategory(String idCategory) async {
  final response = await http.delete(
    Uri.parse('https://api-js-d8yf.onrender.com/api/categorie/$idCategory'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    print('Categoria eliminado exitosamente');
  } else {
    print('Error al eliminar la categoria: ${response.body}');
    throw Exception('Error al eliminar la categoria');
  }
}

Future<void> updateCategory(String idCategory, String nombre) async {
  final url =
      Uri.parse('https://api-js-d8yf.onrender.com/api/categorie/$idCategory');
  final response = await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
    }),
  );

  if (response.statusCode == 200) {
    print('Categoria actualizado exitosamente');
  } else {
    print('Error al actualizar la categoria: ${response.body}');
    throw Exception('Error al actualizar la categoria');
  }
}
