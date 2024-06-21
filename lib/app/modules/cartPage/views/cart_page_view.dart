import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';

import 'package:herai/app/widgets/button_card/button_card_logo.dart';
import 'package:herai/app/widgets/button_card/button_custom.dart';
import 'package:image_picker/image_picker.dart';

import '../../../resource/const/sized_font.dart';
import '../../../widgets/cart/cart_item_card.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.refreshCart(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'cart_gerobakku'.tr,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: SizedFont.textSuperLargexx,
            ),
          ),
          actions: [
            GestureDetector(
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
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsCustom.primaryColor.green,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Color(0xff000000).withOpacity(.24),
                        offset: Offset(0, 4))
                  ],
                ),
                child: Text(
                  'cart_tambah'.tr,
                  style: TextStyleHeading.textH8SuperSmall,
                ),
              ),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 18,
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    controller.cart.value.items.length,
                    (index) => CardCart(
                      id: '${controller.cart.value.items[index]}',
                      item: controller.items[index],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'cart_total_berat'.tr,
                          style: TextStyleHeading.textH7XXSmall
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Obx(() => Text(
                              '${controller.totalWeight.value} Kg',
                              style: TextStyleHeading.textH7XXSmall
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'cart_total_harga'.tr,
                          style: TextStyleHeading.textH7XXSmall
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Obx(
                          () => Text(
                            'HP ${controller.totalPrice.value}',
                            style: TextStyleHeading.textH7XXSmall
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: ButtonCustom(
                      width: Get.width,
                      text: 'cart_ayo_jual'.tr,
                      color: controller.totalWeight.value > 0
                          ? ColorsCustom.primaryColor.green
                          : OthersColor().whiteGrey50,
                      onTap: () => controller.totalWeight.value > 0
                          ? controller.pindahKeAngkut()
                          : {},
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
