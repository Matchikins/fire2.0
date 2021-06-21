import 'package:cefops/Src/models/postesModel.dart';

abstract class IUserRepository {

  Future<List<post>> findAllUsers();

}