// To parse this JSON data, do
//
//     final alunoModel = alunoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AlunoModel alunoModelFromJson(String str) => AlunoModel.fromJson(json.decode(str));

String alunoModelToJson(AlunoModel data) => json.encode(data.toJson());

class AlunoModel {
  AlunoModel({
    required this.name,
    required this.id,
    required this.lastName,
    required this.cpf,
    required this.email,
    required this.photo,
  });

  String name;
  int id;
  String lastName;
  String cpf;
  String email;
  String photo;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
    name: json["name"],
    id: json["id"],
    lastName: json["lastName"],
    cpf: json["cpf"],
    email: json["email"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "lastName": lastName,
    "cpf": cpf,
    "email": email,
    "photo": photo,
  };
}
