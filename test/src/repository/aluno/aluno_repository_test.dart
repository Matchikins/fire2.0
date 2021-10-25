
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:cefops/Src/repository/aluno/AlunosRepository.dart';
import 'package:flutter_test/flutter_test.dart';

main(){


  group(" Teste bucar  alunos", (){

   test("Logar para buscar aluno", () async{
     final login = await Login("adm1", "1234");
     expect(login.token.length, 151);
   });
   test("Buscar todos os alunos", () async{
     final alunos=await GetAllAlunos();
     expect(alunos.length, isNotNull);
   });
   test("Buscar aluno por id", () async{
     final aluno=await GetStudantById("testeMock");
     expect(aluno.name, "Emison");
     expect(aluno.enable, true);
   });

  });

}