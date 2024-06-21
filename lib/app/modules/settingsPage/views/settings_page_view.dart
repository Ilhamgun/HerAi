// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/resource/styles.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/log.dart';

import '../../../resource/colors_data.dart';
import '../controllers/settings_page_controller.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 55),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          leadingWidth: 60,
          title: Text('settings_pengaturan'.tr),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorsCustom.primaryColor.green,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: ColorsCustom.primaryColor.green,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        controller.user.value.profilePicture.isEmpty
                            ? CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/blank_profile.png'),
                                backgroundColor: Color(0xffD9D9D9),
                                minRadius: 24,
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(
                                    controller.user.value.profilePicture),
                                backgroundColor: Color(0xffD9D9D9),
                                minRadius: 24,
                              ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                                  controller.user.value.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(() => Text(
                                  controller.user.value.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        // SettingsFeature(
                        //   name: 'settings_alamat_penjemputan'.tr,
                        //   imageIcon: 'assets/icons/address.png',
                        //   onTap: () =>
                        //       Log.colorGreen('settings_alamat_penjemputan'),
                        // ),
                        // SettingsFeature(
                        //   name: 'settings_riwayat_transaksi'.tr,
                        //   imageIcon: 'assets/icons/payment_history.png',
                        //   onTap: () =>
                        //       Get.toNamed(Routes.HISTORY_TRANSACTION_PAGE),
                        // ),
                        SettingsFeature(
                          name: 'settings_beri_ulasan'.tr,
                          imageIcon: 'assets/icons/feedback.png',
                          onTap: () {
                            Log.colorGreen('settings_beri_ulasan');
                            controller.sendEmail(
                              'heraifeedback@gmail.com',
                              'Aku mau share pengalaman aku pake HerAi nih',
                              'Dear HerAi, \n\nIni aku mau share pengalaman make HerAi nih sama Ada saran juga buat HerAi kedepannya',
                            );
                          },
                        ),
                        SettingsFeature(
                            name: 'settings_hubungi_kami'.tr,
                            imageIcon: 'assets/icons/contact.png',
                            onTap: () => Get.toNamed(Routes.CONTACTUS)

                            // Get.dialog(Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         ButtonCardLogo(
                            //           image: 'assets/images/whatsapp_logo.png',
                            //           onTap: () {
                            //             Get.back();
                            //             controller.openWhatsApp(
                            //               '6282280373122',
                            //             );
                            //           },
                            //         ),
                            //         SizedBox(
                            //           width: 50,
                            //         ),
                            //         ButtonCardLogo(
                            //           image: 'assets/images/email_logo.png',
                            //           onTap: () {
                            //             Get.back();
                            //             controller.sendEmail(
                            //               'appherai@gmail.com',
                            //               '',
                            //               '',
                            //             );
                            //           },
                            //         ),
                            //       ],
                            //     ))
                            // controller.callUs(
                            //     controller.user.username, '6283821939699'),
                            ),
                        SettingsFeature(
                            changeLanguage: true,
                            name: 'settings_ganti_bahasa'.tr,
                            imageIcon: 'assets/icons/language.png',
                            onTap: () {
                              Log.colorGreen('settings_ganti_bahasa');
                              // Get.updateLocale(
                              //   Locale('id'),
                              // );
                            }),
                        SettingsFeature(
                          name: 'settings_syarat_dan_ketentuan'.tr,
                          imageIcon: 'assets/icons/list_view.png',
                          onTap: () =>
                              Get.toNamed(Routes.F_A_Q_PAGE, arguments: false),
                        ),
                        SettingsFeature(
                          name: 'settings_faq'.tr,
                          imageIcon: 'assets/icons/faq.png',
                          onTap: () =>
                              Get.toNamed(Routes.F_A_Q_PAGE, arguments: true),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () => controller.logout(),
                          child: Container(
                            width: Get.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorsCustom.primaryColor.midOrange,
                              ),
                            ),
                            child: Text(
                              'settings_keluar'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyleHeading.textH7XXSmall.copyWith(
                                  color: ColorsCustom.primaryColor.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsFeature extends StatelessWidget {
  final String name;
  final String imageIcon;
  final GestureTapCallback onTap;
  bool changeLanguage;
  String language;
  SettingsFeature({
    Key? key,
    required this.name,
    required this.imageIcon,
    required this.onTap,
    this.changeLanguage = false,
    this.language = 'id',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeLanguage ? null : onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.only(
          right: changeLanguage ? 10 : 0,
          top: changeLanguage ? 0 : 8,
          bottom: changeLanguage ? 0 : 10,
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: ColorsCustom.othersColor.darkGrey40,
            width: 1.0,
          ),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageIcon,
              fit: BoxFit.cover,
              width: 24,
              height: 24,
              // color: ColorsCustom.primaryColor.grey,
            ),
            SizedBox(
              width: 14,
            ),
            Text(
              name,
              style: TextStyleHeading.textH7XXSmall.copyWith(
                color: ColorsCustom.primaryColor.grey,
              ),
            ),
            Spacer(),
            changeLanguage
                ? DropdownButton(
                    elevation: 0,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Bahasa',
                          style: TextStyleCustom.textDefault,
                        ),
                        value: 'id',
                      ),
                      DropdownMenuItem(
                        child: Text('English'),
                        value: 'en',
                      ),
                    ],
                    value: Get.find<AuthController>().languange.value,
                    onChanged: (value) {
                      // print('dropdown_value : ${value}');
                      Get.find<AuthController>().languange.value =
                          value.toString();

                      Get.updateLocale(Locale(value.toString()));
                    },
                  )
                : Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsCustom.primaryColor.grey,
                  ),
          ],
        ),
      ),
    );
  }
}
