import 'package:flutter/material.dart';
import 'package:flutter_application_api/src/controllers/consultarCategorias.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Categorie>>(
        future: consultarCategoria(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Categorie> categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
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
                        category.nombre[0].toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      category.nombre,
                      style: TextStyle(fontWeight: FontWeight.bold),
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
