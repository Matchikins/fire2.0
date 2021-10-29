
import 'package:cefops/Src/model/aluno/AlunoModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudantInfoController extends GetxController{
  static StudantInfoController data=StudantInfoController();
  var name="".obs;
  var lastName="".obs;
  var fullName="".obs;
  var email="".obs;
  var cpf="".obs;
  var photo="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png".obs;
  var dataNacimento="".obs;
  var sexo="".obs;
  var ativo=true;
  var stsCivil="".obs;
  var teleCelular="".obs;
  var teleResidencial="".obs;
  var nacionalidade="".obs;



setInfos(AlunoModel data){
  final DateTime now = data.dataNanscimento;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  fullName.value=data.name+" "+data.lastName;
  name.value=data.name;
  lastName.value=data.lastName;
  email.value=data.email;
  photo.value=data.photo;
  teleCelular.value=data.teleFoneCelular;
  teleResidencial.value=data.teleFone;
  dataNacimento.value=formatted.toString();
  sexo.value=data.sexo;
  nacionalidade.value=data.nacionalidade;
  stsCivil.value=data.estadoCivil;
}

}