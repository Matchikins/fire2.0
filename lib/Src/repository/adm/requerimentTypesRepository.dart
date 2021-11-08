import 'dart:convert';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/model/adm/requeriment_type_model.dart';
import 'package:http/http.dart' as http;


Future<List<RequerimentTypeModel>> GetRequeRequerimentType()async{
  final response=await http.get(
    Uri.parse("${urls.app}/tiposrequerimentos"),
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
    RequerimentTypeController.reqType.setItems(decodeData);
    var model=jsonResponse.map((req) => RequerimentTypeModel.fromJson(req)).toList();


    return model;
  }

  else {

    ErroController.error.ok.value=false;
    print(response.body);
    throw Exception('error');
  }

}
