import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:get/get.dart';

class StudandDetailsController extends GetxController{
  static StudandDetailsController details=StudandDetailsController();
  var navegar=0.obs;
  var gender="Gênero".obs;
  var status="Ativo".obs;
  var civilState="Estado Civil".obs;
  var pageIndex=0.obs;



setActive(bool data){
    switch(data){
      case true:
        return status.value="Ativo" ;
      case false:
        return status.value="Inativo" ;
    }
}

setDropInfos(AlunoModel data){
  gender.value=data.sexo;
   status="Ativo".obs;
  civilState="Estado Civil".obs;

}



}