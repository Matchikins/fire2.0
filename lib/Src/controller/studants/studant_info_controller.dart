
import 'package:cefops/Src/model/aluno/aluno_model.dart';
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
  var birthDate="".obs;
  var gender="".obs;
  var activi=true;
  var stsCivil="".obs;
  var phoneCell="".obs;
  var phoneHome="".obs;
  var nation="".obs;
  var loading=false.obs;


setInfos(AlunoModel data){
  final DateTime now = data.dataNanscimento;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  fullName.value=data.name+" "+data.lastName;
  name.value=data.name;
  lastName.value=data.lastName;
  email.value=data.email;
  photo.value=data.photo;
  phoneCell.value=data.teleFoneCelular;
  phoneHome.value=data.teleFone;
  birthDate.value=formatted.toString();
  gender.value=data.sexo;
  nation.value=data.nacionalidade;
  stsCivil.value=data.estadoCivil;
}

}