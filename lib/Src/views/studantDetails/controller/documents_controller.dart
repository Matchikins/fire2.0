import 'package:cefops/Src/model/aluno/aluno_model.dart';
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
  cpf.value=data.id;
  rg.value="";
  estadoEmissorRg.value=data.endereco.cidade;
  dataEmissorRg.value=data.dataNanscimento.toString();
  titulo.value=data.id;
  estadoEmissortitulo.value=data.endereco.uf;
  zona.value=data.endereco.uf;
  secao.value=data.endereco.uf;
  dataEmissorTitulo.value=data.dataNanscimento.toString();
}





}