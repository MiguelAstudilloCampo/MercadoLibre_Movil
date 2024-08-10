import 'package:flutter/material.dart';
import 'package:flutter_application_api/src/controllers/consultarProductos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: consultarProducto(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
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
                        product.nombre[0].toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      product.nombre,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${product.precio}',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${product.descripcion}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${product.categoria.nombre}',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
