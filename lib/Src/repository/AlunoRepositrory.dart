import 'dart:convert';
import 'package:cefops/Src/model/model_Aluno.dart';
import 'package:cefops/res.dart';
import 'package:http/http.dart' as http;

  Future<List<AlunoModel>> fetchAlunos() async {
    final response = await http.get(
        Uri.parse('https://cefopsweb.herokuapp.com/alunos/'));

    final data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);

    if (response.statusCode == 200) {
      List jsonResponse = decodeData;
      print(jsonResponse[1]);
      return jsonResponse.map((aluno) => AlunoModel.fromJson(aluno)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
