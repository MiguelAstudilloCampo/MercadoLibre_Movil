import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Product>> consultarProducto() async {
  final response = await http
      .get(Uri.parse('https://api-js-d8yf.onrender.com/api/product'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

class Product {
  final String id;
  final String nombre;
  final int precio;
  final String descripcion;
  final Categorie categoria; 

  const Product({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.categoria,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      nombre: json['nombre'] ?? '',
      precio: json['precio'] ?? 0,
      descripcion: json['descripcion'] ?? '',
      categoria: Categorie.fromJson(json['categoria']), 
    );
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
      id: json['_id'] ?? '',
      nombre: json['nombre'] ?? '',
    );
  }
}

Future<void> actualizarProducto(String idProduct, String nombre, String descripcion, int precio, String idCategoria) async {
  final url = Uri.parse('https://api-js-d8yf.onrender.com/api/product/$idProduct');
  final response = await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': idCategoria, 
    }),
  );

  if (response.statusCode == 200) {
    print('Producto actualizado exitosamente');
  } else {
    print('Error al actualizar el producto: ${response.body}');
    throw Exception('Error al actualizar el producto');
  }
}

Future<void> eliminarProducto(String idProduct) async {
  final response = await http.delete(
    Uri.parse('https://api-js-d8yf.onrender.com/api/product/$idProduct'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    print('Producto eliminado exitosamente');
  } else {
    print('Error al eliminar el producto: ${response.body}');
    throw Exception('Error al eliminar el producto');
  }
}

Future<void> registrarProducto(String nombre, int precio, String descripcion, String idCategoria) async {
  final url = Uri.parse('https://api-js-d8yf.onrender.com/api/product');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
      'precio': precio,
      'descripcion': descripcion,
      'categoria': idCategoria,
    }),
  );

  if (response.statusCode == 201) {
    print('Producto registrado exitosamente');
  } else {
    print('Error al registrar el producto: ${response.body}');
    throw Exception('Error al registrar el producto');
  }
}
