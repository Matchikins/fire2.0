
import 'dart:convert';

List<RequerimentModel> requerimentModelFromJson(String str) => List<RequerimentModel>.from(json.decode(str).map((x) => RequerimentModel.fromJson(x)));

String requerimentModelToJson(List<RequerimentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimentModel {
  RequerimentModel({
    required this.id,
    required this.aluno,
    required this.tipo,
    required this.status,
    required this.entregue,
    required this.abertoEm,
    required this.concluido,
    required this.responsavel,
  });

  int id;
  Aluno aluno;
  Tipo tipo;
  String status;
  DateTime entregue;
  DateTime abertoEm;
  bool concluido;
  String responsavel;

  factory RequerimentModel.fromJson(Map<String, dynamic> json) => RequerimentModel(
    id: json["id"],
    aluno: Aluno.fromJson(json["aluno"]),
    tipo: Tipo.fromJson(json["tipo"]),
    status: json["status"],
    entregue: DateTime.parse(json["entregue"]),
    abertoEm: DateTime.parse(json["abertoEm"]),
    concluido: json["concluido"],
    responsavel: json["responsavel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aluno": aluno.toJson(),
    "tipo": tipo.toJson(),
    "status": status,
    "entregue": "${entregue.year.toString().padLeft(4, '0')}-${entregue.month.toString().padLeft(2, '0')}-${entregue.day.toString().padLeft(2, '0')}",
    "abertoEm": abertoEm.toIso8601String(),
    "concluido": concluido,
    "responsavel": responsavel,
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
    required this.grupo,
    required this.diasPentregar,
  });

  int id;
  String name;
  String grupo;
  int diasPentregar;

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
    id: json["id"],
    name: json["name"],
    grupo: json["grupo"],
    diasPentregar: json["diasPentregar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "grupo": grupo,
    "diasPentregar": diasPentregar,
  };
}
