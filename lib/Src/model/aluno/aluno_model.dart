class AlunoModel {
  AlunoModel({
      String? alunoId, 
      List<String>? role, 
      String? foto, 
      String? full Name, 
      String? token,}){
    _alunoId = alunoId;
    _role = role;
    _foto = foto;
    _full Name = full Name;
    _token = token;
}

  AlunoModel.fromJson(dynamic json) {
    _alunoId = json['AlunoId'];
    _role = json['role'] != null ? json['role'].cast<String>() : [];
    _foto = json['foto'];
    _full Name = json['Full Name'];
    _token = json['token'];
  }
  String? _alunoId;
  List<String>? _role;
  String? _foto;
  String? _full Name;
  String? _token;

  String? get alunoId => _alunoId;
  List<String>? get role => _role;
  String? get foto => _foto;
  String? get full Name => _full Name;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AlunoId'] = _alunoId;
    map['role'] = _role;
    map['foto'] = _foto;
    map['Full Name'] = _full Name;
    map['token'] = _token;
    return map;
  }

}