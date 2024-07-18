import 'package:flutter/material.dart';

class PaginaProductos extends StatelessWidget {
  final String categoryName;

  const PaginaProductos({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(products[index]['icon'], size: 40.0),
              title: Text(products[index]['name']),
              subtitle: Text(products[index]['price']),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // Acción al presionar el botón
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> products = [
  {'name': 'Portatil HP', 'price': '\$2.500.000', 'icon': Icons.laptop},
  {
    'name': 'Celular Movl 2024',
    'price': '\$1.500.000',
    'icon': Icons.phone_android
  },
  {'name': 'SmarWatch', 'price': '\$900.000', 'icon': Icons.watch},
  {'name': 'Diademas', 'price': '\$250.000', 'icon': Icons.headphones},
  {
    'name': 'Camara Profesional',
    'price': '\$4.000.0000',
    'icon': Icons.camera_alt
  },
];
