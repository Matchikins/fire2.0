// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.email,
    required this.fullName,
    required this.password,
    required this.username,
  });

  String email;
  String fullName;
  String password;
  String username;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    email: json["email"],
    fullName: json["fullName"],
    password: json["password"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "fullName": fullName,
    "password": password,
    "username": username,
  };
}
