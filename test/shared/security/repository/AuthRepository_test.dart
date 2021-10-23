import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';



main(){

  test("Teste de Autenticação", () async{
   final login= await Login("adm1", "1234");
   expect(login.fullInfo.name, "Emison");
  });


}