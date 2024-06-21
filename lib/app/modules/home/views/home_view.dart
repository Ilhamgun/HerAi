import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/widgets/button_card/button_card_logo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/main_feature_card/main_feature_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff50C346),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  textDirection: TextDirection.rtl,
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 20, bottom: 40),
                      decoration: BoxDecoration(
                        color: ColorsCustom.primaryColor.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.isLoading.isTrue
                                    ? Container(
                                        width: 35,
                                        height: 35,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: ColorsCustom
                                              .primaryColor.midOrange,
                                        ),
                                      )
                                    : controller
                                            .user.value.profilePicture.isEmpty
                                        ? GestureDetector(
                                            onTap: () =>
                                                controller.gotoProfile(),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/blank_profile.png'),
                                              backgroundColor:
                                                  Color(0xffD9D9D9),
                                              minRadius: 24,
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () =>
                                                controller.gotoProfile(),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  controller.user.value.media
                                                      .first.originalUrl),
                                              backgroundColor:
                                                  Color(0xffD9D9D9),
                                              minRadius: 24,
                                            ),
                                          ),
                                Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () =>
                                          Get.toNamed(Routes.CART_PAGE),
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () => controller
                                          .gotoSettings(), //authController.logout(),
                                      icon: Icon(
                                        Icons.settings,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(() => Text(
                                'home_hallo'.trParams(
                                    {'name': '${controller.user.value.name}'}),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                          Text(
                            'home_selamat_datang!'.tr,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -70,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: Get.width - 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Color(0xff000000).withOpacity(.24),
                                offset: Offset(0, 4))
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('HerAi Coins'),
                            SizedBox(height: 10),
                            Text(
                              '${controller.user.value.point}',
                              style: TextStyle(
                                fontSize: 20,
                                color: ColorsCustom.primaryColor.midOrange,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                MainFeatureCard(
                  title: 'home_pilah_sampah'.tr,
                  subTitle:
                      'home_pilah_sampah_yang_dapat_didaur_ulang_menggunakan_kamera'
                          .tr,
                  icon: Icons.camera_alt,
                  onTap: () => Get.dialog(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonCardLogo(
                          image: 'assets/images/imagePick.png',
                          onTap: () {
                            Get.back();
                            controller.pickImage(ImageSource.gallery);
                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        ButtonCardLogo(
                          image: 'assets/images/cameraPick.png',
                          onTap: () {
                            Get.back();
                            controller.pickImage(ImageSource.camera);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                MainFeatureCard(
                    title: 'home_riwayat_transaksi'.tr,
                    subTitle: 'home_ketahui_transaksi_yang_telah_dilakukan'.tr,
                    icon: Icons.my_library_books_rounded,
                    onTap: () => controller.gotoHistoryTransaction()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
