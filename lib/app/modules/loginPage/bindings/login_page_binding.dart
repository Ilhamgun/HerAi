import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
