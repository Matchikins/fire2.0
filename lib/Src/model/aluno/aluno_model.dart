import 'dart:convert';

List<AlunoModel> alunoModelFromJson(String str) => List<AlunoModel>.from(json.decode(str).map((x) => AlunoModel.fromJson(x)));

String alunoModelToJson(List<AlunoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlunoModel {
  AlunoModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.dataNanscimento,
    required this.email,
    required this.teleFone,
    required this.teleFoneCelular,
    required this.photo,
    required this.enabled,
    required this.requerimentos,
    required this.endereco,
    required this.documentos,
    required this.sexo,
    required this.estadoCivil,
    required this.nacionalidade,
    required this.links,
  });

  String id;
  String name;
  String lastName;
  DateTime dataNanscimento;
  String email;
  String teleFone;
  String teleFoneCelular;
  String photo;
  bool enabled;
  List<Requerimento> requerimentos;
  Endereco endereco;
  Documentos documentos;
  String sexo;
  String estadoCivil;
  String nacionalidade;
  List<Link> links;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    dataNanscimento: DateTime.parse(json["dataNanscimento"]),
    email: json["email"],
    teleFone: json["teleFone"],
    teleFoneCelular: json["teleFoneCelular"],
    photo: json["photo"],
    enabled: json["enabled"],
    requerimentos: List<Requerimento>.from(json["requerimentos"].map((x) => Requerimento.fromJson(x))),
    endereco: Endereco.fromJson(json["endereco"]),
    documentos: Documentos.fromJson(json["documentos"]),
    sexo: json["sexo"],
    estadoCivil: json["estadoCivil"],
    nacionalidade: json["nacionalidade"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "dataNanscimento": dataNanscimento.toIso8601String(),
    "email": email,
    "teleFone": teleFone,
    "teleFoneCelular": teleFoneCelular,
    "photo": photo,
    "enabled": enabled,
    "requerimentos": List<dynamic>.from(requerimentos.map((x) => x.toJson())),
    "endereco": endereco.toJson(),
    "documentos": documentos.toJson(),
    "sexo": sexo,
    "estadoCivil": estadoCivil,
    "nacionalidade": nacionalidade,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Documentos {
  Documentos({
    required this.id,
    required this.cpf,
    required this.rg,
    required this.dataemissao,
    required this.orgaoemissor,
    required this.estadoemissor,
    required this.tituloeleitor,
    required this.zona,
    required this.secao,
    required this.dataemissaotitulo,
    required this.estemissortitulo,
    required this.reservista,
    required this.categoriamilitar,
    required this.circoinscricaomitlitar,
    required this.regiaomilitar,
    required this.dataemissaoreservista,
    required this.orgaoemissorreservista,
    required this.situacaomilitar,
    required this.nomedamae,
    required this.nomedopai,
  });

  int id;
  String cpf;
  String rg;
  DateTime dataemissao;
  String orgaoemissor;
  String estadoemissor;
  String tituloeleitor;
  String zona;
  String secao;
  DateTime dataemissaotitulo;
  String estemissortitulo;
  String reservista;
  String categoriamilitar;
  String circoinscricaomitlitar;
  String regiaomilitar;
  DateTime dataemissaoreservista;
  String orgaoemissorreservista;
  String situacaomilitar;
  String nomedamae;
  String nomedopai;

  factory Documentos.fromJson(Map<String, dynamic> json) => Documentos(
    id: json["id"],
    cpf: json["cpf"],
    rg: json["rg"],
    dataemissao: DateTime.parse(json["dataemissao"]),
    orgaoemissor: json["orgaoemissor"],
    estadoemissor: json["estadoemissor"],
    tituloeleitor: json["tituloeleitor"],
    zona: json["zona"],
    secao: json["secao"],
    dataemissaotitulo: DateTime.parse(json["dataemissaotitulo"]),
    estemissortitulo: json["estemissortitulo"],
    reservista: json["reservista"],
    categoriamilitar: json["categoriamilitar"],
    circoinscricaomitlitar: json["circoinscricaomitlitar"],
    regiaomilitar: json["regiaomilitar"],
    dataemissaoreservista: DateTime.parse(json["dataemissaoreservista"]),
    orgaoemissorreservista: json["orgaoemissorreservista"],
    situacaomilitar: json["situacaomilitar"],
    nomedamae: json["nomedamae"],
    nomedopai: json["nomedopai"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cpf": cpf,
    "rg": rg,
    "dataemissao": dataemissao.toIso8601String(),
    "orgaoemissor": orgaoemissor,
    "estadoemissor": estadoemissor,
    "tituloeleitor": tituloeleitor,
    "zona": zona,
    "secao": secao,
    "dataemissaotitulo": dataemissaotitulo.toIso8601String(),
    "estemissortitulo": estemissortitulo,
    "reservista": reservista,
    "categoriamilitar": categoriamilitar,
    "circoinscricaomitlitar": circoinscricaomitlitar,
    "regiaomilitar": regiaomilitar,
    "dataemissaoreservista": dataemissaoreservista.toIso8601String(),
    "orgaoemissorreservista": orgaoemissorreservista,
    "situacaomilitar": situacaomilitar,
    "nomedamae": nomedamae,
    "nomedopai": nomedopai,
  };
}

class Endereco {
  Endereco({
    required this.id,
    required this.cep,
    required this.rua,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.uf,
  });

  int id;
  String cep;
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String uf;

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
    id: json["id"],
    cep: json["cep"],
    rua: json["rua"],
    numero: json["numero"],
    complemento: json["complemento"],
    bairro: json["bairro"],
    cidade: json["cidade"],
    estado: json["estado"],
    uf: json["uf"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cep": cep,
    "rua": rua,
    "numero": numero,
    "complemento": complemento,
    "bairro": bairro,
    "cidade": cidade,
    "estado": estado,
    "uf": uf,
  };
}

class Link {
  Link({
    required this.rel,
    required this.href,
  });

  String rel;
  String href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    rel: json["rel"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "rel": rel,
    "href": href,
  };
}

class Requerimento {
  Requerimento({
    required this.id,
    required this.tipo,
    required this.status,
    required this.abertoEm,
    required this.entregue,
    required this.concluido,
    required this.responsavel,
  });

  int id;
  Tipo tipo;
  String status;
  DateTime abertoEm;
  DateTime entregue;
  bool concluido;
  String responsavel;

  factory Requerimento.fromJson(Map<String, dynamic> json) => Requerimento(
    id: json["id"],
    tipo: Tipo.fromJson(json["tipo"]),
    status: json["status"],
    abertoEm: DateTime.parse(json["abertoEm"]),
    entregue: DateTime.parse(json["entregue"]),
    concluido: json["concluido"],
    responsavel: json["responsavel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo.toJson(),
    "status": status,
    "abertoEm": abertoEm.toIso8601String(),
    "entregue": entregue.toIso8601String(),
    "concluido": concluido,
    "responsavel": responsavel,
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




