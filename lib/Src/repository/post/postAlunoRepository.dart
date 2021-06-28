import 'dart:convert';
import 'package:cefops/Src/model/Aluno_Model.dart';
import 'package:http/http.dart' as http;

Future<AlunoModel> createAluno(int id,String name,String lastName,int Cpf,String email,int grupe,) async {
  final response = await http.post(
    Uri.parse('https://cefopsweb.herokuapp.com/alunos/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
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