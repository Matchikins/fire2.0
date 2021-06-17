class alunosModel {
  int ?teacherID;
  Null ?curso;
  int ?id;
  String ?email;
  String ?lastName;
  int ?cpf;
  int ?grupe;
  int ?courseId;
  String ?name;

  alunosModel(
      {this.teacherID,
        this.curso,
        this.id,
        this.email,
        this.lastName,
        this.cpf,
        this.grupe,
        this.courseId,
        this.name});

  alunosModel.fromJson(Map<String, dynamic> json) {
    teacherID = json['teacherID'];
    curso = json['curso'];
    id = json['id'];
    email = json['email'];
    lastName = json['lastName'];
    cpf = json['cpf'];
    grupe = json['grupe'];
    courseId = json['courseId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacherID'] = this.teacherID;
    data['curso'] = this.curso;
    data['id'] = this.id;
    data['email'] = this.email;
    data['lastName'] = this.lastName;
    data['cpf'] = this.cpf;
    data['grupe'] = this.grupe;
    data['courseId'] = this.courseId;
    data['name'] = this.name;
    return data;
  }
}