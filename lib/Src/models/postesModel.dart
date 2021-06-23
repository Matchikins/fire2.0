
import 'dart:convert';
class UserModel {

  int id;
  String name;

  
  UserModel({
    this.id,
    this.name,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      id: map['id'] ?? 1,
      name: map['name'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
