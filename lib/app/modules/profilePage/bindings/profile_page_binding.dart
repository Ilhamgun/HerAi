import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
