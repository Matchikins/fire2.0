
import 'package:cefops/Src/get/repository/I_uSER.dart';
import 'package:cefops/Src/get/repository/user_repository_get_connect.dart';
import 'package:get/get.dart';

import 'get_connect_controller.dart';

class GetConnectBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IUserRepository>(UserRepositoryGetConnect(Get.find()));
    Get.put(GetConnectController(Get.find()));
  }
}
