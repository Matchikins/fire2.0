import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cefops/Src/controller/controller_cep.dart';
import 'package:http/http.dart' as http;
import 'package:cefops/Src/model/cep_model.dart';

Future <CepModel> GetCep(cpf) async{
  http.Response response = await http.get(
    Uri.parse('https://viacep.com.br/ws/${cpf}/json'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },


  ).timeout(Duration(
      seconds: 5),
      onTimeout: () {


        return throw TimeoutException("Connection Time out");
      }

  );
  try{
    if (response.statusCode==200) {
      var cep=CepModel.fromJson(jsonDecode(response.body));
      cepControll.cepst.bairro.value=cep.bairro;
      cepControll.cepst.uf.value=cep.uf;
      cepControll.cepst.localidade.value=cep.localidade;
      cepControll.cepst.logradouro.value=cep.logradouro;
      cepControll.cepst.complemento.value=cep.complemento;


      return cep;

    }
  }catch (e){
    return throw new Exception("error");


  }
  return throw SocketException("Falha na conexão, verifique sua rede");

}
