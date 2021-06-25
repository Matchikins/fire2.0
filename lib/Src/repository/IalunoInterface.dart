import 'package:cefops/Src/model/Aluno_Model.dart';

abstract class ialunoRepository {

  Future<List<AlunoModel>> findAllUsers();

}