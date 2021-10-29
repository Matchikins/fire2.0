class LoginModel {
  LoginModel({
    required this.role,
    required this.fullInfo,
    required this.token,
  });
  late final List<String> role;
  late final FullInfo fullInfo;
  late final String token;

  LoginModel.fromJson(Map<String, dynamic> json){
    role = List.castFrom<dynamic, String>(json['role']);
    fullInfo = FullInfo.fromJson(json['fullInfo']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['role'] = role;
    _data['fullInfo'] = fullInfo.toJson();
    _data['token'] = token;
    return _data;
  }
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
  late final String id;
  late final String name;
  late final String lastName;
  late final String cpf;
  late final String email;
  late final String photo;
  late final bool enable;

  FullInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    cpf = json['cpf'];
    email = json['email'];
    photo = json['photo'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['lastName'] = lastName;
    _data['cpf'] = cpf;
    _data['email'] = email;
    _data['photo'] = photo;
    _data['enable'] = enable;
    return _data;
  }
}