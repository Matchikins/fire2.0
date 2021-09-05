import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Shared/Security/Model/ErrorModel.dart';
import 'package:cefops/Shared/Security/Model/LoginModel.dart';
import 'package:cefops/Shared/Security/Services/Logar.dart';
import 'package:http/http.dart' as http;

String token="";
Future<LoginModel> Login(String username,String password) async {
  http.Response response = await http.post(
    Uri.parse('http://192.168.43.54:8810/auth/signin'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password
    }),

  ).timeout(Duration(
      seconds: 20),
      onTimeout: () {
        statusApp.status.loading.value = false;
        statusApp.status.erros1.value = "Falha na conexão, verifique sua rede";
        return throw TimeoutException("Connection Time out");
      }
  );

  try {
    if (response.statusCode == 200) {
      ErroController.error.ok.value = true;
      var mod = LoginModel.fromJson(jsonDecode(response.body));
      token = mod.token;
      print(response.body);
      UserController.user.token.value = mod.token;
      UserController.user.name.value = mod.username;
      UserController.user.role.value = mod.role;

      return mod;
    }
    else {
      return throw new Exception("Erro 01");
    }
  }
  catch (_) {
    if (response.statusCode == 500) {
      var erros = ErrorModel.fromJson(jsonDecode(response.body));

      if (erros.message == "Invalid username or password !") {
        statusApp.status.loading.value = false;
        statusApp.status.erros1.value = "Usuário ou senha Incorreta";
        throw new Exception("Usuário ou senha Incorreta");
      }
      Logar();
    }
    if (response.statusCode == 403) {
      return Logar();
    }

    else {
      statusApp.status.loading.value = false;
      statusApp.status.erros1.value = "Falha na conexão, verifique sua rede";
      return throw SocketException("Falha na conexão, verifique sua rede");
    }
  }
}


