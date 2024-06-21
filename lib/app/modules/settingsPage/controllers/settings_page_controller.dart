import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/data_source/shared_pref_secure_storage.dart';
import '../../../data/entities/user.dart';

class SettingsPageController extends GetxController {
  Rx<UserProfile> user = UserProfile.empty().obs;
  RxString language = 'id'.obs;
  @override
  void onInit() {
    user.value = Get.arguments['user'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> willPop(BuildContext context) async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff50C346),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return true;
  }

  void openWhatsApp(String messageTo) async {
    String _url =
        "https://api.whatsapp.com/send?phone=$messageTo&text=Halo%20Kak!%0ASelamat%20datang%20di%20Layanan%20HerAi.%20Ada%20yang%20dapat%20kami%20bantu?%20%F0%9F%98%8A"; //url(messageTo, myName);

    await canLaunchUrl(Uri.parse(_url))
        ? await launchUrl(
            Uri.parse(_url),
            mode: LaunchMode.externalApplication,
          )
        : throw const FormatException("Invalid URL");
  }

  String url(String phone, String message) {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
    }
  }

  // String openEmail(String email, String message) {
  //   if (Platform.isAndroid) {
  //     // add the [https]
  //     return "mailto:agusfernandoft@gmail.com?subject=News&body=New%20plugin"; // new line
  //   } else {
  //     // add the [https]
  //     return "mailto:agusfernandoft@gmail.com?subject=News&body=New%20plugin"; // new line
  //   }
  // }

  Future<void> sendEmail(String email, String subject, String body) async {
    String emailUrl =
        "mailto:$email?subject=${Uri.parse(subject)}&body=${Uri.parse(body)}";

    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      await launchUrl(
        Uri.parse(emailUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "Error occured sending an email";
    }
    // await launchUrl(
    //   Uri.parse('https://mail.google.com/mail/u/0/#inbox'),
    //   mode: LaunchMode.externalApplication,
    // );
  }

  Future<void> logout() async {
    print('logout : ');
    SharedPrefSecureStorage.getInstance()!.saveToken('');
    Get.find<AuthController>().googleLogout();
    Get.back();
    Get.offNamed(Routes.LOGIN_PAGE);
  }
}
