
import 'dart:convert';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/model/adm/RequerimentModel.dart';
import 'package:http/http.dart' as http;


Future<List<RequerimentModel>> GetAllRequeriment()async{
  final response=await http.get(
    Uri.parse("${urls.app}/requerimetos"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
  );

  final data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);

  if (response.statusCode == 200) {

    ErroController.error.ok.value=true;
    List jsonResponse = decodeData;



    return jsonResponse.map((req) => RequerimentModel.fromJson(req)).toList();
  }


  else {

    ErroController.error.ok.value=false;
    print(response.body);
    throw Exception('error');
  }

}

Future<RequerimentModel> CeeateRequeriment() async {
  isAluno();
  final response = await http.post(
    Uri.parse('${urls.app}/requerimento'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
    body: jsonEncode(<String, dynamic>{
      "id": 1,
      "aluno": {
        "id": RequerimentController.req.idStudant,

      },
      "tipo": {
        "id": RequerimentController.req.tipoRequeriment,

      },

    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return RequerimentModel.fromJson(jsonDecode(response.body));
  } else if(response.statusCode==409) {

    throw Exception('conflito de usuario');

  }
  else if(response.statusCode==500) {

    throw Exception('Seção Expirada');

  }
  else if(response.statusCode==400) {

    throw Exception('falha na requisição');

  }else{
    throw Exception("erro ao criar usuario");
  }
}
Future <void> updateReq(int id,String resp,String status) async {
  statusApp.status.loading.value=true;
  print("${urls.app}/requerimetos?id=$id&responsavel=$resp&st=$status}");
  final response = await http.patch(
    Uri.parse('${urls.app}/requerimetos?id=$id&responsavel=$resp&st=$status'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
  );

  if (response.statusCode == 200) {

    statusApp.status.loading.value=false;
    statusApp.status.clicouAtualizar.value=true;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Falha ao atualizar');
  }
}


