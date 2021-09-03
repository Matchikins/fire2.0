import 'dart:convert';

import 'package:cefops/Shared/Security/Model/LoginModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


Future<LoginModel> Login(String username,String password) async {
 String token="Bearer }".obs as String;
  final response = await http.post(
    Uri.parse('http://localhost:8810/auth/signin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'username': username,
      'password':password
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return LoginModel.fromJson(jsonDecode(response.body));
  }
  if (response.statusCode==500) {
    print(username);
    throw new Exception("Usuário ou senha Incorreta");

  }  
  else {
    // If the server did not return a 201 CREATED response,
   print(response.body);
    throw Exception('Falha no Login');
  }
}


