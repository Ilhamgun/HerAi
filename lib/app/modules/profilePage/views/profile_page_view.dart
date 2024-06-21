import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/widgets/avatar_profile/avatar_vertical_profile.dart';
import 'package:herai/app/widgets/button_card/button_card_logo.dart';
import 'package:herai/app/widgets/button_card/button_card_transaction.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff50C346),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => controller.isloading.isTrue
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorsCustom.primaryColor.green,
                      strokeWidth: 4,
                      backgroundColor: Colors.white,
                    ),
                  )
                : SingleChildScrollView(
                    child: RefreshIndicator(
                      onRefresh: () async => controller.refreshPage(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            color: ColorsCustom.primaryColor.green,
                            height: 55,
                            child: IconButton(
                                color: Colors.white,
                                iconSize: 24,
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.arrow_back)),
                          ),
                          Obx(
                            () => AvatarVerticalProfileNameEmail(
                              user: controller.user.value,
                              onTap: () => {
                                Get.dialog(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonCardLogo(
                                        image: 'assets/images/imagePick.png',
                                        onTap: () {
                                          Get.back();
                                          controller.changeImage(context,
                                              source: ImageSource.gallery);
                                        },
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      ButtonCardLogo(
                                        image: 'assets/images/cameraPick.png',
                                        onTap: () {
                                          Get.back();
                                          controller.changeImage(context,
                                              source: ImageSource.camera);
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: Get.width - 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: ColorsCustom.primaryColor.green)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(() => Container(
                                          constraints: BoxConstraints(
                                              maxWidth: Get.width * .35),
                                          child: Text(
                                            'HC ${controller.user.value.point}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: ColorsCustom
                                                    .primaryColor.midOrange,
                                                fontWeight: FontWeight.w700,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('HerAi Coins'),
                                  ],
                                ),
                                Container(
                                  width: 2,
                                  height: 50,
                                  color: ColorsCustom.darkGrey30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(() => Container(
                                          constraints: BoxConstraints(
                                              maxWidth: Get.width * .35),
                                          child: Text(
                                            '${controller.user.value.overview.progress.totalTransaction}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: ColorsCustom
                                                    .primaryColor.midOrange,
                                                fontWeight: FontWeight.w700,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        )),
                                    SizedBox(height: 10),
                                    Text('profile_total_transaksi'.tr),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('profile_coin_transaksi'.tr),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ButtonCardTransaction(
                                            iconAssets:
                                                'assets/icons/bank_transfer.png',
                                            textTodo:
                                                'profile_transfer_ke_bank'.tr),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
