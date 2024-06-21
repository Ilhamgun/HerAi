import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/home_v2_controller.dart';

class HomeV2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeV2Controller>(
      () => HomeV2Controller(),
    );
    // Get.lazyPut<ProfilePageController>(
    //   () => ProfilePageController(),
    // );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
