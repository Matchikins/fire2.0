import 'dart:convert';

import 'package:cefops/Src/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<PostModel> fetchPosts()   async {
  final response =
  await http.get(Uri.parse('https://cefopsweb.herokuapp.com/post/1'));
  final String data=response.body;
  var decodeData=jsonDecode(data);
  if (response.statusCode == 200) {
      print(decodeData);
    return PostModel.fromJson(decodeData);
  } else {

    throw Exception('Failed to load ');
  }
}