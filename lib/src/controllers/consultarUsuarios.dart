import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Users>> consultarUsuarios() async {
  final response =
      await http.get(Uri.parse('https://api-js-5wen.onrender.com/api/user'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load jewelry products');
  }
}

class Users {
  final String name;
  final String email;

  const Users({
    required this.name,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      name: json['name'],
      email: json['email'],
    );
  }
}
