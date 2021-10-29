import 'package:cefops/Src/model/aluno/AlunoModel.darto';
import 'package:get/get.dart';
import "dart:developer" as developer;
class DocumentsController extends GetxController{
  static DocumentsController data =DocumentsController();

  var cpf="".obs;
  var rg="".obs;
  var estadoEmissorRg="".obs;
  var dataEmissorRg="".obs;
  var titulo="".obs;
  var estadoEmissortitulo="".obs;
  var zona="".obs;
  var secao="".obs;
  var dataEmissorTitulo="".obs;

  deleteAllData(){
     cpf.value="";
     rg.value="";
     estadoEmissorRg.value="";
     dataEmissorRg.value="";
     titulo.value="";
     estadoEmissortitulo.value="";
     zona.value="";
     secao.value="";
     dataEmissorTitulo.value="";
  }

setDocuments(AlunoModel data){
  cpf.value=data.cpf;
  rg.value="";
  estadoEmissorRg.value=data.cpf;
  dataEmissorRg.value=data.cpf;
  titulo.value=data.cpf;
  estadoEmissortitulo.value=data.cpf;
  zona.value=data.cpf;
  secao.value=data.cpf;
  dataEmissorTitulo.value=data.cpf;

}





}