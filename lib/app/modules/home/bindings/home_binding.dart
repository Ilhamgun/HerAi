import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
