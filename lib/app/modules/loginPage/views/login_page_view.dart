import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';

import '../../../widgets/button_card/button_card_logo.dart';
import '../../../widgets/text_form/text_form_style_title_custom.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  AuthController authController = Get.find<AuthController>();
  LoginPageController loginPageController = Get.find<LoginPageController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 90,
                    width: 155,
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: Image.asset('assets/images/HerAi_title.png',
                        fit: BoxFit.contain),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Obx(
                        () => Form(
                          key: controller.formKey,
                          autovalidateMode: (controller.autoValidate.value)
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              TextFormStyleTitleCustom(
                                hintText: 'login_masukan_email'.tr,
                                formController: controller.emailTextController,
                                titleStyle: TextStyle(fontSize: 12),
                                validatorForm: (value) {
                                  controller.emailTextController.text =
                                      value ?? "";
                                  if (value!.isEmpty) {
                                    return "Email tidak boleh kosong";
                                  } else if (RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return 'Email tidak valid';
                                  }
                                  return null;
                                },
                              ),
                              TextFormStyleTitleCustom(
                                hintText: 'login_masukan_password'.tr,
                                iconSuffix: controller.visibilityPassword.isTrue
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.visibility,
                                          color: Colors.green.shade600,
                                        ),
                                        onPressed: () {
                                          controller.visibilityPassword
                                              .toggle();
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.visibility_off,
                                          color: Colors.green.shade600,
                                        ),
                                        onPressed: () {
                                          controller.visibilityPassword
                                              .toggle();
                                        },
                                      ),
                                obsecureText:
                                    !controller.visibilityPassword.value,
                                formController:
                                    controller.passwordTextController,
                                titleStyle: TextStyle(fontSize: 12),
                                validatorForm: (value) {
                                  if (value!.isEmpty)
                                    return "password tidak boleh kosong".tr;
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: StadiumBorder(),
                          ),
                          onPressed: () => loginPageController.login(
                              context,
                              controller.emailTextController.text,
                              controller.passwordTextController.text),
                          child: Text('login_masuk'.tr),
                        ),
                      ),
                      SizedBox(
                        height: Platform.isIOS ? 16 : 32,
                      ),
                      Platform.isIOS
                          ? Container()
                          : Text('login_atau_masuk_dengan'.tr),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Platform.isIOS
                              ? Container()
                              : ButtonCardLogo(
                                  image: 'assets/images/google_logo.png',
                                  onTap: () {
                                    loginPageController.googleSignIn();
                                  },
                                ),
                          // Platform.isIOS
                          //     ? ButtonCardLogo(
                          //         image: 'assets/images/apple_logo.png',
                          //         onTap: () => null,
                          //       )
                          //     : Container(),
                          // ButtonCardLogo(
                          //   image: 'assets/images/facebook_logo.png',
                          //   onTap: () => null,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'login_tidak_punya_akun'.tr,
                          ),
                          GestureDetector(
                            onTap: () => controller.launchInBrowser(),
                            child: Text(
                              'login_daftar_sekarang'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
