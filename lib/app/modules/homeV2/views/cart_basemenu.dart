import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';

import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';

import 'package:herai/app/widgets/button_card/button_custom.dart';
import 'package:image_picker/image_picker.dart';

import '../../../resource/const/sized_font.dart';
import '../../../widgets/cart/cart_item_card.dart';

class CartBaseMenu extends StatelessWidget {
  HomeV2Controller baseController = Get.find<HomeV2Controller>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => baseController.refreshCart(),
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
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: Obx(
          () => Container(
            child: baseController.isLoading.isTrue
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Obx(
                          () => Column(
                            children: List.generate(
                              baseController.cart.value.items.length,
                              (index) => CardCart(
                                id: '${baseController.cart.value.items[index]}',
                                item: baseController.items[index],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'cart_total_berat'.tr,
                                    style: TextStyleHeading.textH7XXSmall
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Obx(() => Text(
                                        '${baseController.totalWeight.value} Kg',
                                        style: TextStyleHeading.textH7XXSmall
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'cart_total_harga'.tr,
                                    style: TextStyleHeading.textH7XXSmall
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Obx(
                                    () => Text(
                                      'HP ${baseController.totalPrice.value}',
                                      style: TextStyleHeading.textH7XXSmall
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ButtonCustom(
                          text: 'cart_upload_bukti'.tr,
                          textColor: ColorsCustom.primaryColor.green,
                          color: Colors.white,
                          borderColor: ColorsCustom.primaryColor.green,
                          onTap: () => baseController.changeImage(context,
                              picProfile: false, source: ImageSource.gallery),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Obx(() => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 44),
                              child: ButtonCustom(
                                width: Get.width,
                                text: 'cart_ayo_jual'.tr,
                                color: baseController.totalWeight.value > 0
                                    ? ColorsCustom.primaryColor.green
                                    : OthersColor().whiteGrey50,
                                onTap: () =>
                                    baseController.totalWeight.value > 0
                                        ? baseController.pindahKeAngkut()
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
        ),
      ),
    );
  }
}
