import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Perfilusuario extends StatelessWidget {
  const Perfilusuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Perfil",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("http://imagen.jpg"),
              ),
              SizedBox(height: 10),
              Text("Miguel Angel",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_2, color: Colors.blue),
                    title: Text("Genero"),
                    trailing: Text(
                      "Masculino",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.cake, color: Colors.blue),
                    title: Text("Cumpleaños"),
                    trailing: Text(
                      "28-05-2005",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text("Numero de telefono"),
                    trailing: Text(
                      "+57 3148720602",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text("Cambiar contraseña"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
