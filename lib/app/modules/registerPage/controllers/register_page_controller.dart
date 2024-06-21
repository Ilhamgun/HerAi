import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/entities/user.dart';
import 'package:herai/app/data/network/request/register_email_request.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../routes/app_pages.dart';

class RegisterPageController extends GetxController {
  AuthRepository authRepository = Get.find<AuthRepository>();
  TextEditingController emailRegisterTextController = TextEditingController();

  TextEditingController nameRegisterTextController = TextEditingController();
  TextEditingController passwordRegisterTextController =
      TextEditingController();
  TextEditingController repasswordRegisterTextController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<bool> autoValidate = false.obs;
  Rx<bool> visibilityPassword = false.obs;
  Rx<bool> visibilityRePassword = false.obs;
  UserProfile _user = UserProfile.empty();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailRegisterTextController.clear();
    nameRegisterTextController.clear();
    passwordRegisterTextController.clear();
    repasswordRegisterTextController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    emailRegisterTextController.dispose();
    nameRegisterTextController.dispose();
    passwordRegisterTextController.dispose();
    repasswordRegisterTextController.dispose();
  }

  Future<void> postRegister() async {
    // print(
    //     'data_register: \nemail : ${emailRegisterTextController.text} \nname : ${nameRegisterTextController.text} \npass : ${passwordRegisterTextController.text} \nRepass : ${repasswordRegisterTextController.text}');
    if (formKey.currentState!.validate()) {
      var request = RegisterEmailRequest(
          email: emailRegisterTextController.text,
          name: nameRegisterTextController.text,
          password: passwordRegisterTextController.text,
          passwordConfirmation: repasswordRegisterTextController.text);
      try {
        _user =
            await authRepository.registerEmail(request) ?? UserProfile.empty();
        if (_user.name.isNotEmpty)
          Get.offNamed(Routes.HOME_V2, arguments: {'user': _user});
      } on Exception {
        Get.snackbar(
          'Register Failed',
          'Email sudah terdaftar/ password tidak sama',
          maxWidth: 250,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.5),
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      }
    }
  }
}
// asik@gmail.com
