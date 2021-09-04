import 'dart:convert';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/model/AlunoModel.dart';
import 'package:cefops/Shared/Security/Model/ErrorModel.dart';
import 'package:cefops/Shared/Security/Model/LoginModel.dart';
import 'package:cefops/Shared/Security/Services/Logar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

String token="";
Future<LoginModel> Login(String username,String password) async {

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
    ErroController.error.ok.value=true;
    var mod=LoginModel.fromJson(jsonDecode(response.body));
    token =mod.token;
    UserController.user.token.value=mod.token;
    UserController.user.name.value=mod.username;
    UserController.user.role.value=mod.role;

    return mod;
  }
  if (response.statusCode==500) {
    var erros=ErrorModel.fromJson(jsonDecode(response.body));

    if (erros.message=="Invalid username or password !") {
      throw new Exception("Usuário ou senha Incorreta");


    }
    Logar();


  }
  if(response.statusCode==403){
    return Logar();
  }
  else {
    // If the server did not return a 201 CREATED response,
   print(response.body);
    throw Exception('Falha no Login');
  }
}


