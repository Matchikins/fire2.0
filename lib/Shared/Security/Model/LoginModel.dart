// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.role,
    required this.fullInfo,
    required this.token,
  });

  List<String> role;
  FullInfo fullInfo;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    role: List<String>.from(json["role"].map((x) => x)),
    fullInfo: FullInfo.fromJson(json["fullInfo"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "role": List<dynamic>.from(role.map((x) => x)),
    "fullInfo": fullInfo.toJson(),
    "token": token,
  };
}

class FullInfo {
  FullInfo({
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

  factory FullInfo.fromJson(Map<String, dynamic> json) => FullInfo(
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
