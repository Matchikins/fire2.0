// To parse this JSON data, do
//
//     final requerimentModel = requerimentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RequerimentModel> requerimentModelFromJson(String str) => List<RequerimentModel>.from(json.decode(str).map((x) => RequerimentModel.fromJson(x)));

String requerimentModelToJson(List<RequerimentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimentModel {
  RequerimentModel({
    required this.id,
    required this.aluno,
    required this.tipo,
    required this.entregue,
  });

  int id;
  Aluno aluno;
  Tipo tipo;
  DateTime entregue;

  factory RequerimentModel.fromJson(Map<String, dynamic> json) => RequerimentModel(
    id: json["id"],
    aluno: Aluno.fromJson(json["aluno"]),
    tipo: Tipo.fromJson(json["tipo"]),
    entregue: DateTime.parse(json["entregue"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aluno": aluno.toJson(),
    "tipo": tipo.toJson(),
    "entregue": "${entregue.year.toString().padLeft(4, '0')}-${entregue.month.toString().padLeft(2, '0')}-${entregue.day.toString().padLeft(2, '0')}",
  };
}

class Aluno {
  Aluno({
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

  factory Aluno.fromJson(Map<String, dynamic> json) => Aluno(
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

class Tipo {
  Tipo({
    required this.id,
    required this.name,
    required this.diasPentregar,
  });

  int id;
  String name;
  int diasPentregar;

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
    id: json["id"],
    name: json["name"],
    diasPentregar: json["diasPentregar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "diasPentregar": diasPentregar,
  };
}
