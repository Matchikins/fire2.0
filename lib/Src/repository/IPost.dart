
import 'package:cefops/Src/model/user_model.dart';

abstract class iPosteRepository {

  Future<List<PostModel>> findAllUsers();

}