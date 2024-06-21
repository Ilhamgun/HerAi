import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/finish_page_controller.dart';

class FinishPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishPageController>(
      () => FinishPageController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
