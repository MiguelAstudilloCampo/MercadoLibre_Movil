import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     );
//   }
// }
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio de Sesion"),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 16.0),
                Title(
                    color: Colors.black,
                    child: Text(
                      "Bienvenido a Mercado Libre",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 16.0),
                Title(
                    color: Colors.black,
                    child: Text(
                      "Iniciar Sesion para continuar",
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    )),
                SizedBox(height: 30.0),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Digita tu Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                SizedBox(height: 15.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Digita tu Contraseña",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Iniciar Sesion"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "O Inice Sesion con",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv-nQIlXaRli1Tw6UcGFz0FcAt1lOMEjxW9w&s",
                      height: 41,
                      width: 41,
                    ),
                    label: Text("Google"),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBF73o0P4eNj_YuVFZtaVHAxum9_p4ARUOAg&s",
                      height: 41,
                      width: 41,
                    ),
                    label: Text("Facebook"),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Olvido su Contraseña",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registro');
                  },
                  child: Text(
                    "No tienes cuenta registrate",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
