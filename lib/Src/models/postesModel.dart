class post {
  int ?id ;
  String ?name;

  post({this.id, this.name} );

  post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}