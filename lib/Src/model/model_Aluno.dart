// To parse this JSON data, do
//
//     final alunoModel = alunoModelFromJson(jsonString);
import 'package:meta/meta.dart';
import 'dart:convert';

AlunoModel alunoModelFromJson(String str) => AlunoModel.fromJson(json.decode(str));

String alunoModelToJson(AlunoModel data) => json.encode(data.toJson());

class AlunoModel {
  AlunoModel({
    required this.teacherId,
    required this.curso,
    required this.id,
    required this.email,
    required this.lastName,
    required this.courseId,
    required this.grupe,
    required this.cpf,
    required this.name,
  });

  int teacherId;
  dynamic curso;
  int id;
  String email;
  String lastName;
  int courseId;
  int grupe;
  int cpf;
  String name;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
    teacherId: json["teacherID"],
    curso: json["curso"],
    id: json["id"],
    email: json["email"],
    lastName: json["lastName"],
    courseId: json["courseId"],
    grupe: json["grupe"],
    cpf: json["cpf"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "teacherID": teacherId,
    "curso": curso,
    "id": id,
    "email": email,
    "lastName": lastName,
    "courseId": courseId,
    "grupe": grupe,
    "cpf": cpf,
    "name": name,
  };
}
