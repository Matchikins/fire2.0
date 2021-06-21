import 'dart:convert';
import 'package:cefops/Src/models/postesModel.dart';
final String url ="https://cefopsweb.herokuapp.com/diciplinas";
Future<post> postes() async {
  final response;
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Faiil');
  }
}