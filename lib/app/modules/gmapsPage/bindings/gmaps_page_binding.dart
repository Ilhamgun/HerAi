import 'package:get/get.dart';

import '../controllers/gmaps_page_controller.dart';

class GmapsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GmapsPageController>(
      () => GmapsPageController(),
    );
  }
}
