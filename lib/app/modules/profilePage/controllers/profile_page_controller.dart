import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/entities/user.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/utils/log.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageController extends GetxController {
  AuthRepository authRepository = Get.find<AuthRepository>();
  HomeV2Controller baseController = Get.find<HomeV2Controller>();

  Rx<UserProfile> user = UserProfile.empty().obs;

  RxBool isloading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    // user.value = Get.arguments['user'];
    user.value = await getUser();

    print('profile_page here');
    isloading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> refreshPage() async {
    Log.colorGreen('REFRESH_NIHHHH');
    isloading.value = true;
    user.value = await getUser();
    isloading.value = false;
  }

  Future<UserProfile> getUser() async {
    try {
      if (user.value.name.isEmpty)
        user.value = await authRepository.getUserData();
    } catch (e) {
      Log.info('INI ERROR NYA : $e');
    }
    Log.colorGreen('GET_USER : ${user.value.profilePicture}');
    return user.value;
  }

  Future<void> changeImage(BuildContext context,
      {required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      var response = await postImage(file: File(image.path));
      if (response) {
        var update = await authRepository.getUserData();
        user.value = update;
        baseController.user.value = update;

        final snackBar = SnackBar(
          content: Text("Upload Successfully"),
          duration: Duration(milliseconds: 500),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<bool> postImage({required File file}) async {
    var response = false;

    var profile = {
      '_method': 'PATCH',
      'name': '${user.value.name}',
      'email': '${user.value.email}',
    };

    response = await authRepository.postEditProfile(profile, file);
    user.value = response ? await getUser() : user.value;

    return response;
  }
}

// class User {
//   final String name;
//   final String email;

// }
