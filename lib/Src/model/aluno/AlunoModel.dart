// To parse this JSON data, do
//
//     final alunoModel = alunoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final alunoModel = alunoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AlunoModel> alunoModelFromJson(String str) => List<AlunoModel>.from(json.decode(str).map((x) => AlunoModel.fromJson(x)));

String alunoModelToJson(List<AlunoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlunoModel {
  AlunoModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.cpf,
    required this.email,
    required this.photo,
    required this.dataNanscimento,
    required this.sexo,
    required this.estadoCivil,
    required this.enable,
    required this.teleFoneCelular,
    required this.nacionalidade,
    required this.teleFone,
  });

  String id;
  String name;
  String lastName;
  String cpf;
  String email;
  String photo;
  DateTime dataNanscimento;
  String sexo;
  String estadoCivil;
  bool enable;
  String teleFoneCelular;
  String nacionalidade;
  String teleFone;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    cpf: json["cpf"],
    email: json["email"],
    photo: json["photo"],
    dataNanscimento: DateTime.parse(json["dataNanscimento"]),
    sexo: json["sexo"],
    estadoCivil: json["estadoCivil"],
    enable: json["enable"],
    teleFoneCelular: json["teleFoneCelular"],
    nacionalidade: json["nacionalidade"],
    teleFone: json["teleFone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "cpf": cpf,
    "email": email,
    "photo": photo,
    "dataNanscimento": dataNanscimento.toIso8601String(),
    "sexo": sexo,
    "estadoCivil": estadoCivil,
    "enable": enable,
    "teleFoneCelular": teleFoneCelular,
    "nacionalidade": nacionalidade,
    "teleFone": teleFone,
  };
}


OneStudantModel oneStudantModelFromJson(String str) => OneStudantModel.fromJson(json.decode(str));

String oneStudantModelToJson(OneStudantModel data) => json.encode(data.toJson());




class OneStudantModel {
  OneStudantModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.cpf,
    required this.email,
    required this.photo,
    required this.enable,
  });

  String id;
  String name;
  String lastName;
  String cpf;
  String email;
  String photo;
  bool enable;

  factory OneStudantModel.fromJson(Map<String, dynamic> json) => OneStudantModel(
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    cpf: json["cpf"],
    email: json["email"],
    photo: json["photo"],
    enable: json["enable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "cpf": cpf,
    "email": email,
    "photo": photo,
    "enable": enable,
  };
}
