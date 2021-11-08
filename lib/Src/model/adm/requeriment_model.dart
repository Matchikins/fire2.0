import 'dart:convert';

List<RequerimentModel> requerimentModelFromJson(String str) => List<RequerimentModel>.from(json.decode(str).map((x) => RequerimentModel.fromJson(x)));

String requerimentModelToJson(List<RequerimentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimentModel {
  RequerimentModel({
    required this.id,
    required this.tipo,
    required this.status,
    required this.abertoEm,
    required this.responsavel,
    required this.entregue,
    required this.concluido,
    required this.links,
  });

  int id;
  Tipo tipo;
  String status;
  DateTime abertoEm;
  String responsavel;
  DateTime entregue;
  bool concluido;
  List<dynamic> links;

  factory RequerimentModel.fromJson(Map<String, dynamic> json) => RequerimentModel(
    id: json["id"],
    tipo: Tipo.fromJson(json["tipo"]),
    status: json["status"],
    abertoEm: DateTime.parse(json["abertoEm"]),
    responsavel: json["responsavel"],
    entregue: DateTime.parse(json["entregue"]),
    concluido: json["concluido"],
    links: List<dynamic>.from(json["links"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo.toJson(),
    "status": status,
    "abertoEm": abertoEm.toIso8601String(),
    "responsavel": responsavel,
    "entregue": entregue.toIso8601String(),
    "concluido": concluido,
    "links": List<dynamic>.from(links.map((x) => x)),
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
