import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/Security/Services/Logar.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/model/AlunoModel.dart';
import 'package:http/http.dart' as http;

Future<List<AlunoModel>> GetAllAlunos()async{
  statusApp.status.loading.value = true;
  final response = await http.get(
    Uri.parse("http://192.168.43.54:8810/api/v1/alunos"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
  );
  final data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);
  print("********************");
  print(response.statusCode);
  print("********************");
  if (response.statusCode == 200) {
    statusApp.status.loading.value = false;

    ErroController.error.ok.value = true;
    List jsonResponse = decodeData;

    return jsonResponse.map((aluno) => AlunoModel.fromJson(aluno)).toList();
  }

  if (response.statusCode==500) {
    ErroController.error.ok.value = false;
    statusApp.status.loading.value = false;

    return Logar();
  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    statusApp.status.loading.value = false;

    ErroController.error.ok.value = false;
    print(response.body);
    throw Exception('error');
  }
}
Future<AlunoModel> createAluno(int id,String name,String lastName,int Cpf,String email,int grupe,) async {
  final response = await http.post(
    Uri.parse('http://localhost:8810/api/v1/alunos'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
    body: jsonEncode(<String, dynamic>{
      'id': Cpf,
      'cpf':Cpf,
      'name':name,
      'lastName':lastName,
      'email':email,
      "grupe":grupe,

    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return AlunoModel.fromJson(jsonDecode(response.body));
  } else if(response.statusCode==409) {

    throw Exception('conflito de usuario');

  }
  else if(response.statusCode==400) {

    throw Exception('falha na requisição');

  }else{
    throw Exception("erro ao criar usuario");
  }
}