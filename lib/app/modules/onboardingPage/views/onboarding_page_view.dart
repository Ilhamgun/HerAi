import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/widgets/onboarding/card_onboarding.dart';
import 'package:herai/app/widgets/onboarding/dot_indicator_model_1.dart';

import '../controllers/onboarding_page_controller.dart';

class OnboardingPageView extends GetView<OnboardingPageController> {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 3), () {
    //   SharedPrefSecureStorage.getInstance()!.setPrefOnBoarding(1);
    //   print('onboarding init');
    //   Get.offNamed(Routes.LOGIN_PAGE);
    // });
    return Scaffold(
      body: Container(
        color: Colors.white30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (now) {
                  controller.currentPage.value = now;
                },
                children: [
                  CardOnboardingStyle(
                    pathImage: controller.pathImage[0],
                    title: "HerAi untuk Indonesia",
                    subTitle:
                        "Bersama kami jadikan Indonesia bersih dari sampah",
                  ),
                  CardOnboardingStyle(
                    pathImage: controller.pathImage[1],
                    title: "Daur ulang sampah dari mana saja",
                    subTitle:
                        "Kolektor bank sampah terdekat akan jemput sampahmu dimanapun kamu berada!",
                  ),
                  CardOnboardingStyle(
                    pathImage: controller.pathImage[2],
                    title: "Tukarkan sampahmu menjadi uang",
                    subTitle:
                        "Tukarkan sampahmu menjadi uangSampah yang kamu jual akan kami ubah menjadi HP (HerAi Points) yang tukarkan menjadi saldo E-wallet, voucher, uang tunai",
                  ),
                ],
              ),
            ),
            Obx(() => Visibility(
                  visible: controller.currentPage.value == 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorsCustom.primaryColor.green,
                                minimumSize: Size(127, 33)),
                            onPressed: () => Get.offNamed(Routes.LOGIN_PAGE),
                            child: Text('Masuk'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorsCustom.primaryColor.midOrange,
                                minimumSize: Size(127, 33)),
                            onPressed: () => Get.offNamed(Routes.REGISTER_PAGE),
                            child: Text('Daftar'),
                          ),
                        ],
                      ),
                      Obx(
                        () => DotIndicatorModel1(
                          currentPage: controller.currentPage.value,
                          dataLength: controller.pathImage.length,
                        ),
                      ),
                    ],
                  ),
                )),
            Obx(() => Visibility(
                  visible: controller.currentPage.value < 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () => controller.changePage(
                                currentIdx: 2, jump: true),
                            child: Text('Lewati')),
                        Obx(
                          () => DotIndicatorModel1(
                            currentPage: controller.currentPage.value,
                            dataLength: controller.pathImage.length,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 25,
                          decoration: BoxDecoration(
                              color: PrimaryColor().green,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () => controller.changePage(
                                    currentIdx:
                                        controller.currentPage.value + 1,
                                    jump: false),
                                icon: Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
