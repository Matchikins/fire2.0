import 'dart:convert';
import 'package:cefops/Src/model/post_model.dart';
import 'package:http/http.dart' as http;

Future<PostModel> FetchPosts(context)   async {
  final response =
  await http.get(Uri.parse('https://cefopsweb.herokuapp.com/post/1'));
  final data=utf8.decode(response.bodyBytes);
  var decodeData=jsonDecode(data);
  if (response.statusCode == 200) {
      print(decodeData);
    return PostModel.fromJson(decodeData);
  } else {

    throw Exception('Failed to load ');
  }
}