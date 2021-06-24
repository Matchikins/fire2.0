
import 'package:cefops/Src/model/user_model.dart';

abstract class IUserRepository {
  
  Future<List<PostModel>> findAllUsers();
  
}