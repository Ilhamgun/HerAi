import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';
import 'package:herai/app/widgets/button_card/button_custom.dart';

import '../controllers/finish_page_controller.dart';

class FinishPageView extends GetView<FinishPageController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorsCustom.primaryColor.green.withOpacity(.1),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: WillPopScope(
        onWillPop: () => controller.willPop(context),
        child: Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Image.asset('assets/icons/finish.png'),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'success_berhasil'.tr,
                    style: TextStyleHeading.textH4Default.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ColorsCustom.primaryColor.midOrange),
                  ),
                  Text(
                    controller.message.value,
                    textAlign: TextAlign.center,
                    style: TextStyleHeading.textH7XXSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  ButtonCustom(
                    text: 'success_halaman_awal'.tr,
                    width: Get.width,
                    color: ColorsCustom.primaryColor.green,
                    onTap: () => controller.gotoHome(context),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ButtonCustom(
                      text: 'success_lihat_riwayat_transaksi'.tr,
                      textColor: ColorsCustom.primaryColor.green,
                      width: Get.width,
                      color: Colors.white,
                      borderColor: ColorsCustom.primaryColor.green,
                      onTap: () => controller.gotoHistoryTransaction()),
                  SizedBox(
                    height: 24,
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
