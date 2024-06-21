import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/entities/user.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/log.dart';

class FinishPageController extends GetxController {
  AuthRepository authRepository = Get.find<AuthRepository>();
  HomeV2Controller homeV2Controller = Get.find<HomeV2Controller>();

  UserProfile user = UserProfile.empty();

  RxString message =
      "success_pengiriman_akan_diteruskan_ke_pengepul_silahkan_cek_status_di_riwayat_transaksi"
          .tr
          .obs;

  @override
  void onInit() {
    super.onInit();
    message.value = Get.arguments["message"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> willPop(BuildContext context) async {
    // FocusScope.of(context).unfocus();
    Get.back();
    Get.back();
    Get.back();
    homeV2Controller.gotoMenu(0);

    return true;
  }

  void gotoHistoryTransaction() async {
    user = await getUser();

    Get.toNamed(Routes.HISTORY_TRANSACTION_PAGE, arguments: {'user': user});
  }

  void gotoHome(BuildContext context) async {
    Get.back();
    Get.back();
    Get.back();
    homeV2Controller.gotoMenu(0);
  }

  Future<UserProfile> getUser() async {
    try {
      if (user.name.isEmpty) user = await authRepository.getUserData();

      Log.colorGreen('user : ${user.name}');
    } catch (e) {
      Log.info('INI ERROR NYA : $e');
    }
    return user;
  }
}
