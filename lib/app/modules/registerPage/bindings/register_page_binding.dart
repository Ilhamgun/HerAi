import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/register_page_controller.dart';

class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(
      () => RegisterPageController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
