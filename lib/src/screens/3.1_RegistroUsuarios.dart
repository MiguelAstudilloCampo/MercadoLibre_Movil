import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginadeRegistro extends StatefulWidget {
  const PaginadeRegistro({super.key});

  @override
  State<PaginadeRegistro> createState() => _PaginadeRegistroState();
}

class _PaginadeRegistroState extends State<PaginadeRegistro> {
  final _formKey = GlobalKey<FormState>();
  String txtNombres = "";
  String txtEmail = "";
  String txtPassword = "";
  int txtEdad = 0; // Variable para almacenar la edad

  Future<void> _registerUser() async {
    final url = Uri.parse('https://api-js-d8yf.onrender.com/api/user');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': txtNombres,
        'correo': txtEmail,
        'contrasenia': txtPassword,
        'edad': txtEdad, // Enviar la edad en la solicitud
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro erroneo')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Ir a registrarse..",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Crear una nueva cuenta",
                  ),
                  SizedBox(height: 24.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nombre completo",
                      prefixIcon: Icon(Icons.person_3_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese nombre completo";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtNombres = value!;
                    },
                  ),
                  SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtEmail = value!;
                    },
                  ),
                  SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Edad", // Etiqueta para el campo de edad
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType
                        .number, // Asegurarse de que el teclado sea numérico
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese edad";
                      }
                      if (int.tryParse(value) == null ||
                          int.tryParse(value)! <= 0) {
                        return "Ingrese una edad válida"; // Validación para asegurarse de que la edad sea un número positivo
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtEdad =
                          int.parse(value!); // Guardar la edad como entero
                    },
                  ),
                  SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese password";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtPassword = value!;
                    },
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Repita el Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Repita el password";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Opcional: Comparar contraseñas para validar
                    },
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Validar el formulario
                          _formKey.currentState!
                              .save(); // Guardar el formulario si es válido
                          _registerUser(); // Llamar a la función para registrar el usuario
                        }
                      },
                      child: Text("Registrarse"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/inicio');
                        },
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
