// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.role,
    required this.username,
    required this.token,
  });

  List<String> role;
  String username;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    role: List<String>.from(json["role"].map((x) => x)),
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "role": List<dynamic>.from(role.map((x) => x)),
    "username": username,
    "token": token,
  };
}
