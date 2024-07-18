import 'package:flutter/material.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({Key? key}) : super(key: key);

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  final _formKey = GlobalKey<FormState>();
  String Nombres = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Regístrate",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese nombre completo";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Nombres = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirmar Password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('registro exitoso')),
                        );
                      }
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text("Registrarse"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[400],
                        foregroundColor: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Tienes una cuenta?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Inicia sesion",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
