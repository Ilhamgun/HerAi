import 'package:get/get.dart';

import '../controllers/image_result_page_controller.dart';

class ImageResultPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageResultPageController>(
      () => ImageResultPageController(),
    );
  }
}
