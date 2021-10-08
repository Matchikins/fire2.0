import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/Security/Model/SignUpModel.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Shared/Security/Model/ErrorModel.dart';
import 'package:cefops/Shared/Security/Model/LoginModel.dart';
import 'package:cefops/Shared/Security/Services/Logar.dart';
import 'package:http/http.dart' as http;

String token="";
Future<LoginModel> Login(String username,String password) async {
  http.Response response = await http.post(
    Uri.parse('${urls.auth}/signin'),

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
      statusApp.status.loading.value = false;
      ErroController.error.ok.value = true;
      var mod = LoginModel.fromJson(jsonDecode(response.body));
      token = mod.token;
      print(response.body);
      UserController.user.token.value = mod.token;
      UserController.user.name.value = mod.fullInfo.name;
      UserController.user.lastName.value=mod.fullInfo.lastName;
      UserController.user.email.value=mod.fullInfo.email;
      UserController.user.photo.value=mod.fullInfo.photo;
      statusApp.status.devendo.value=mod.fullInfo.enable;
      UserController.user.role.value = mod.role;
      UserController.user.id.value=mod.fullInfo.cpf;
      print(mod);

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
        statusApp.status.erros1.value = "usuário ou senha inválido";
        throw new Exception("Usuário ou senha Incorreta");
      }

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

Future <SignUpModel> SingUpNewUser(fristName,lastName,cpf,email,password) async{
  statusApp.status.loading.value=true;
  http.Response response = await http.post(
    Uri.parse('${urls.auth}/signup'),


    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": email,
      "password": password,
      "email": email,
      "fristName": fristName,
      "lastName": lastName,
      "cpf":cpf
    }),

  ).timeout(Duration(
      seconds: 5),
      onTimeout: () {
        statusApp.status.loading.value = false;
        statusApp.status.erros1.value = "Falha na conexão, verifique sua rede";

        return throw TimeoutException("Connection Time out");
      }

  );
  try{
    if (response.statusCode==200) {
      var singUp=SignUpModel.fromJson(jsonDecode(response.body));
      statusApp.status.loading.value=false;

      return singUp;

    }
  }catch (e){
    statusApp.status.loading.value=false;
   return throw new Exception("error");


  }
  return throw SocketException("Falha na conexão, verifique sua rede");

}
