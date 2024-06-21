// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/modules/homeV2/views/cart_basemenu.dart';
import 'package:herai/app/modules/homeV2/views/home_basemenu.dart';
import 'package:herai/app/modules/homeV2/views/profile_basemenu.dart';
import 'package:herai/app/modules/profilePage/views/profile_page_view.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/utils/log.dart';
import 'package:herai/app/widgets/button_card/button_card_logo.dart';
import 'package:image_picker/image_picker.dart';

class HomeV2View extends GetView<HomeV2Controller> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 3.0),
                  color: ColorsCustom.primaryColor.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 28,
                )),
            onPressed: () {
              Get.dialog(
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
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                // type: BottomNavigationBarType.fixed,
                elevation: 0,
                iconSize: 24,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: controller.currentIndex.value,
                backgroundColor: Colors.white,
                selectedItemColor: ColorsCustom.primaryColor.green,
                unselectedItemColor: Colors.black,
                onTap: (value) {
                  controller.gotoMenu(value);
                  Log.colorGreen(
                      'currentIndex : ${controller.currentIndex.value}');
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home, size: 24), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_rounded, size: 24),
                      label: 'Profile'),
                ],
              )),
          body: GetBuilder<HomeV2Controller>(
              id: 'baseMenuView',
              builder: (controller) {
                return SafeArea(
                  child: Obx(() => IndexedStack(
                        index: controller.currentIndex.value,
                        children: [
                          HomeBaseMenu(),
                          CartBaseMenu(),
                        ],
                      )),
                );
              }),
        ),
      ),
    );
  }
}
