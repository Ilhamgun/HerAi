import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/widgets/avatar_profile/avatar_horizontal_profile_name_email.dart';
import '../../../resource/colors_data.dart';
import '../../../widgets/order_history_card/order_history_card.dart';
import '../controllers/history_transaction_page_controller.dart';

class HistoryTransactionPageView
    extends GetView<HistoryTransactionPageController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff50C346),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () => controller.willPop(context),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(Get.width, 55),
            child: AppBar(
              title: Text('history_transaction_riwayat_transaksi'.tr),
              centerTitle: true,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xfB50C346),
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  color: ColorsCustom.primaryColor.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => AvatarProfileNameEmail(
                            user: controller.user.value,
                          )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Obx(() => Container(
                                padding: EdgeInsets.only(bottom: 10),
                                color: ColorsCustom.primaryColor.green,
                                child: TabBar(
                                  controller: controller.tabController,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelPadding: EdgeInsets.all(0),
                                  indicatorColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  onTap: (value) =>
                                      controller.onTapChooseBar(value),
                                  labelColor: Colors.green,
                                  unselectedLabelStyle:
                                      TextStyle(color: Colors.white),
                                  unselectedLabelColor: Colors.white,
                                  tabs: [
                                    Container(
                                      width: Get.width,
                                      margin: EdgeInsets.only(left: 8),
                                      decoration: BoxDecoration(
                                        color: controller.choosebar.value == 0
                                            ? Colors.white
                                            : ColorsCustom.othersColor.green50,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6),
                                            bottomLeft: Radius.circular(6)),
                                        border: Border.all(
                                          color:
                                              ColorsCustom.primaryColor.green,
                                        ),
                                      ),
                                      child: Tab(
                                        text: 'history_transaction_menunggu'.tr,
                                      ),
                                    ),
                                    Container(
                                      width: Get.width,
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: controller.choosebar.value == 1
                                            ? Colors.white
                                            : ColorsCustom.othersColor.green50,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(6),
                                            bottomRight: Radius.circular(6)),
                                        border: Border.all(
                                          color:
                                              ColorsCustom.primaryColor.green,
                                        ),
                                      ),
                                      child: Tab(
                                        text: 'history_transaction_selesai'.tr,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Center(
                            child: Container(
                              height: Get.height * .678,
                              child: TabBarView(
                                controller: controller.tabController,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Obx(
                                    () => SingleChildScrollView(
                                      child: Column(
                                          children: controller
                                              .transactionWaiting
                                              .map((e) => OrderHistoryCard
                                                  .fromTransactionData(
                                                      e,
                                                      controller
                                                          .user.value.name))
                                              .toList()),
                                    ),
                                  ),
                                  Obx(
                                    () => SingleChildScrollView(
                                      child: Column(
                                          children: controller
                                              .transactionSuccess
                                              .map((e) => OrderHistoryCard
                                                  .fromTransactionData(
                                                      e,
                                                      controller
                                                          .user.value.name))
                                              .toList()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
