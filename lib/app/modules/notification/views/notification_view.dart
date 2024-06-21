import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';
import 'package:herai/app/widgets/empty_state/notification_empty.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  NotificationView({Key? key}) : super(key: key);
  HomeV2Controller baseController = Get.find<HomeV2Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifikasi_title'.tr),
        centerTitle: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsCustom.primaryColor.green,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Obx(() => Container(
            child: controller.isLoading.isTrue
                ? Center(child: CircularProgressIndicator())
                : controller.listNotif.isEmpty
                    ? Center(child: EmptyStateNotification())
                    : SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            controller.listNotif.length,
                            (index) {
                              var duration = controller.timeNotif(
                                  controller.listNotif[index].createdAt);

                              return GestureDetector(
                                onTap: () {
                                  controller.putRadNotification(
                                      controller.listNotif[index].id);
                                  baseController.gotoHistoryTransaction();
                                },
                                child: Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: index.isEven // isSelected
                                        ? Color(0xffE3FFDD)
                                        : Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: ColorsCustom
                                              .othersColor.darkGrey40),
                                      bottom: BorderSide(
                                          color: ColorsCustom
                                              .othersColor.darkGrey40),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width * .5,
                                            child: Text(
                                              '${controller.listNotif[index].data.title}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyleCustom.textSmall
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                          Text(
                                            duration,
                                            style: TextStyleCustom.textSmall
                                                .copyWith(
                                                    color: ColorsCustom
                                                        .primaryColor.green),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        controller
                                            .listNotif[index].data.message,
                                        textAlign: TextAlign.start,
                                        style: TextStyleCustom.textSmall,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
          )),
    );
  }
}
