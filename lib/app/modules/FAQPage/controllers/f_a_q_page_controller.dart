import 'package:get/get.dart';

class FAQPageController extends GetxController {
  Rx<bool> isfaq = false.obs;
  @override
  void onInit() async {
    super.onInit();

    isfaq.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
