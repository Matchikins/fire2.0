class couseModel {
  String? id;
  String ?name;
  String ?notes;

  couseModel({this.id, this.name, this.notes});

  couseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['notes'] = this.notes;
    return data;
  }

}