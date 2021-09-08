import 'package:get/get.dart';

class statusApp extends GetxController {
  static statusApp status = statusApp();
  var loged = false.obs;
  var loading = false.obs;
  var senhaIncorreta = false.obs;
  var erros1 = "".obs;
  var verSenha = true.obs;
  var user = "".obs;
  var password = "".obs;
  var closeDialog=1.obs;
  var devendo=false.obs;
  var  selectedIndex = 0.obs;
  var title="Início".obs;
  var adm=false.obs;
  var aluno=false.obs;
  var secretaria=false.obs;
  var financeiro=false.obs;
}
