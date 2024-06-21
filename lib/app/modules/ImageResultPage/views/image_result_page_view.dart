import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';
import 'package:herai/app/routes/app_pages.dart';

import '../../../resource/const/sized_font.dart';
import '../../../widgets/button_card/button_custom.dart';
import '../controllers/image_result_page_controller.dart';

class ImageResultPageView extends GetView<ImageResultPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'result_hasil'.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: SizedFont.textSuperLargexx,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: controller.path.value.isEmpty
                    ? Image.asset(
                        'assets/images/image_not_founded.png',
                        width: Get.width,
                        height: Get.height * .4,
                        fit: BoxFit.contain,
                      )
                    : Image.file(
                        File(controller.path.value),
                        width: Get.width,
                        height: Get.height * .4,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Obx(
              () => Container(
                child: controller.isLoading.isTrue
                    ? Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.status.value.classEnum ==
                                  'camera_result_recyclable'
                              ? Icon(
                                  Icons.check_circle,
                                  color: ColorsCustom.primaryColor.green,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.red,
                                  size: 30,
                                ),
                          Text(
                            controller.status.value.classEnum.tr,
                            style: TextStyleHeading.textH4Default.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          controller.status.value.classEnum ==
                                  'camera_result_organic'
                              ? Text(
                                  'result_sampah_organik_tidak_bisa_dijual_mohon_pisah_sampahnya_ya'
                                      .tr,
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyleHeading.textH7XXSmall.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : controller.status.value.classEnum ==
                                      'camera_result_recyclable'
                                  ? Text(
                                      'result_sampah_daur_ulang'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyleHeading.textH7XXSmall
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      'result_sampah_ini_tidak_bisa_di_daur_ulang_dan_tidak_bisa_dijual_mohon_pisah_sampahnya_ya'
                                          .tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyleHeading.textH7XXSmall
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 24),
                            padding: const EdgeInsets.symmetric(horizontal: 44),
                            child: ButtonCustom(
                              width: Get.width,
                              text: controller.status.value.classEnum ==
                                      'camera_result_recyclable'
                                  ? 'Pilih Jenis Sampah'
                                  : 'result_halaman_awal'.tr,
                              color: controller.status.value.classEnum ==
                                      'camera_result_recyclable'
                                  ? ColorsCustom.primaryColor.green
                                  : ColorsCustom.primaryColor.midOrange,
                              onTap: controller.status.value.classEnum ==
                                      'camera_result_recyclable'
                                  ? () {
                                      Get.toNamed(Routes.PILIH_SAMPAH,
                                          arguments: {
                                            'imagePath': controller.path.value
                                          });
                                    }
                                  : () => Get.back(),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
