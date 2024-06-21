import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/log.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/entities/model_result.dart';
import '../../../data/entities/user.dart';

class HomeController extends GetxController {
  AuthRepository authRepository = Get.find<AuthRepository>();

  Rx<ModelResult> status =
      ModelResult(confidence: 0.0, index: 0, label: "camera_result_recyclable")
          .obs;

  RxBool isLoading = true.obs;

  Rx<UserProfile> user = UserProfile.empty().obs;

  @override
  void onInit() async {
    user.value = await getUser();

    isLoading.value = false;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void gotoProfile() {
    print('openProfile');
    Get.toNamed(
      Routes.PROFILE_PAGE,
      arguments: {'user': user.value},
    );
  }

  void gotoSettings() {
    Get.toNamed(Routes.SETTINGS_PAGE, arguments: {'user': user.value});
  }

  void gotoHistoryTransaction() {
    Get.toNamed(Routes.HISTORY_TRANSACTION_PAGE,
        arguments: {'user': user.value});
  }

  Future<UserProfile> getUser() async {
    try {
      if (user.value.name.isEmpty)
        user.value = await authRepository.getUserData();
    } catch (e) {
      Log.info('INI ERROR NYA : $e');
    }
    return user.value;
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemp = File(image.path);
      // this.image = imageTemp;

      goToResultPage(image);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  void goToResultPage(XFile image) async {
    // await classifyImageCase
    //     .runModel(image.path)
    //     .then((value) => {status.value = value});

    print('result_camera : ${image.path}');

    Get.toNamed(
      Routes.IMAGE_RESULT_PAGE,
      arguments: {
        'path': image.path,
        // 'status': status.value,
      },
    );
  }
}
