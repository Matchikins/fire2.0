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
    required this.enable,
  });

  String id;
  String name;
  String lastName;
  String cpf;
  String email;
  String photo;
  bool enable;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
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
