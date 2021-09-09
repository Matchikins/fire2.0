import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:get/get.dart';
class RequerimentController{
  static RequerimentController req=RequerimentController();
  var idAluno="".obs;
  var tipoRequerimento=0.obs;
}


isAluno(){
  if (UserController.user.role.value=="Aluno") {
    RequerimentController.req.idAluno.value=UserController.user.id.value;
  }  else{

  }
}