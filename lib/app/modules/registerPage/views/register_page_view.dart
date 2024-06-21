import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/routes/app_pages.dart';

import '../../../widgets/text_form/text_form_style_title_custom.dart';
import '../controllers/register_page_controller.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                Column(
                  children: [
                    Text(
                      'register_judul_daftar'.tr,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => Form(
                        key: controller.formKey,
                        autovalidateMode: (controller.autoValidate.value)
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            TextFormStyleTitleCustom(
                              hintText: 'register_masukan_email'.tr,
                              formController:
                                  controller.emailRegisterTextController,
                              titleStyle: TextStyle(fontSize: 12),
                              validatorForm: (value) {
                                controller.emailRegisterTextController.text =
                                    value ?? "";
                                if (value!.isEmpty) {
                                  return "Email tidak boleh kosong";
                                }
                                // else if (RegExp(
                                //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                //     .hasMatch(value)) {
                                //   return 'Email tidak valid';
                                // }
                                return null;
                              },
                            ),
                            TextFormStyleTitleCustom(
                              hintText: 'register_masukan_nama_lengkap'.tr,
                              formController:
                                  controller.nameRegisterTextController,
                              titleStyle: TextStyle(fontSize: 12),
                              validatorForm: (value) {
                                controller.nameRegisterTextController.text =
                                    value ?? "";
                                if (value!.isEmpty) {
                                  return "Nama tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            TextFormStyleTitleCustom(
                              hintText: 'register_masukan_password'.tr,
                              iconSuffix: IconButton(
                                icon: Icon(
                                  controller.visibilityPassword.isTrue
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.green.shade600,
                                ),
                                onPressed: () {
                                  controller.visibilityPassword.toggle();
                                },
                              ),
                              obsecureText:
                                  !controller.visibilityPassword.value,
                              formController:
                                  controller.passwordRegisterTextController,
                              titleStyle: TextStyle(fontSize: 12),
                              validatorForm: (value) {
                                if (value!.isEmpty)
                                  return "password tidak boleh kosong";
                                return null;
                              },
                            ),
                            TextFormStyleTitleCustom(
                              hintText: 'register_konfirmasi_password'.tr,
                              iconSuffix: IconButton(
                                icon: Icon(
                                  controller.visibilityRePassword.isTrue
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.green.shade600,
                                ),
                                onPressed: () {
                                  controller.visibilityRePassword.toggle();
                                },
                              ),
                              obsecureText:
                                  !controller.visibilityRePassword.value,
                              formController:
                                  controller.repasswordRegisterTextController,
                              titleStyle: TextStyle(fontSize: 12),
                              validatorForm: (value) {
                                if (value!.isEmpty)
                                  return "password tidak boleh kosong";
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () => controller.postRegister(),
                        child: Text(
                          'register_daftar'.tr,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('register_ask'.tr),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(Routes.LOGIN_PAGE);
                          },
                          child: Text(
                            'register_login'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
