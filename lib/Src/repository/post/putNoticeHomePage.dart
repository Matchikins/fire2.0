import 'dart:convert';
import 'package:cefops/Src/model/post_model.dart';
import 'package:http/http.dart' as http;

Future<PostModel> UpdateNews(String title,String post) async {
  final response = await http.put(
    Uri.parse('https://cefopsweb.herokuapp.com/post/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'poste':post
    }),
  );

  if (response.statusCode == 200) {

    return PostModel.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to update album.');
  }
}