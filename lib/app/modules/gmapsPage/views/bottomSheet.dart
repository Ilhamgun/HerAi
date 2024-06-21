import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/entities/herai_point.dart';
import 'package:herai/app/modules/gmapsPage/controllers/gmaps_page_controller.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';
import 'package:herai/app/utils/log.dart';
import 'package:herai/app/widgets/button_card/button_custom.dart';

class BottomGmapsInfo extends StatefulWidget {
  const BottomGmapsInfo({Key? key}) : super(key: key);

  @override
  _BottomGmapsInfoState createState() => _BottomGmapsInfoState();
}

class _BottomGmapsInfoState extends State<BottomGmapsInfo> {
  GmapsPageController controller = Get.find<GmapsPageController>();
  bool bannerInfo = false;
  bool pickupService = false;
  bool dropPointService = false;

  @override
  Widget build(BuildContext context) {
    return _bottomInfo(controller.allPoints);
  }

  Widget _bottomInfo(List<HerAiPoint> allPoints) {
    return Container(
      width: Get.width,
      height: Get.height * .5,
      decoration: BoxDecoration(
        color: Color(0xffFBF9F7),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: Get.width * .25,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => _gmapsLocation(
                      title_info: 'gmaps_titik_penjemputan',
                      info: controller.pickUpLocation.value,
                      // '${controller.originLocation.value.latitude}, ${controller.originLocation.value.longitude}')),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => _gmapsLocation(
                        title_info: 'gmaps_herAi_poin',
                        info:
                            '${controller.nearestPoint.value.address}\n(${controller.destinationLocation.value.latitude}, ${controller.destinationLocation.value.longitude})'),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !bannerInfo,
              child: Column(
                  children: controller.allPoints
                      .map(
                        (point) => GestureDetector(
                          onTap: () {
                            Log.colorGreen('AKU_DICLICK ${bannerInfo}');
                            setState(() {
                              controller.nearestPoint.value = point;
                              bannerInfo = true;
                              Log.colorGreen('AKU_DICLICK ${bannerInfo}');
                              pickupService =
                                  point.pickupService == 1 ? true : false;
                              dropPointService =
                                  point.dropPointService == 1 ? true : false;
                            });
                          },
                          child: _herAiPoint(
                            location: point.name,
                            address: point.address,
                            time:
                                "Buka dari jam ${point.openTime} - ${point.closeTime}",
                            last: point.id == allPoints.last.id,
                          ),
                        ),
                      )
                      .toList()),
            ),
            Visibility(
              visible: bannerInfo,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                pickupService
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color:
                                    pickupService ? Colors.green : Colors.red,
                              ),
                              Text(
                                  ' Pos ini ${pickupService ? '' : 'tidak '}menyediakan layanan pick up')
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                dropPointService
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: dropPointService
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              Text(
                                  ' Pos ini ${dropPointService ? '' : 'tidak '}menyediakan layanan drop point')
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonCustom(
                          width: Get.width * .4,
                          text: 'Drop Point',
                          color: dropPointService
                              ? ColorsCustom.primaryColor.green
                              : ColorsCustom.othersColor.darkGrey30,
                          onTap: controller.isloading.isTrue
                              ? () {}
                              : () {
                                  controller.pickUpAction();
                                },
                        ),
                        ButtonCustom(
                          width: Get.width * .4,
                          text: 'Pick Up',
                          color: pickupService
                              ? ColorsCustom.primaryColor.green
                              : ColorsCustom.othersColor.darkGrey30,
                          onTap: controller.isloading.isTrue
                              ? () {}
                              : () {
                                  controller.pickUpAction();
                                },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _herAiPoint(
      {required String location,
      required String address,
      required String time,
      required bool last}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: ColorsCustom.othersColor.darkGrey30),
          bottom: BorderSide(
              color: last ? ColorsCustom.othersColor.darkGrey30 : Colors.white),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location,
            style: TextStyleHeading.textH8SuperSmall,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            address,
            style: TextStyleHeading.textH8SuperSmall
                .copyWith(fontSize: 10, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            time,
            style: TextStyleHeading.textH8SuperSmall.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: ColorsCustom.primaryColor.green),
          ),
        ],
      ),
    );
  }

  Widget _gmapsLocation({required String title_info, required String info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title_info.tr,
          style: TextStyleHeading.textH6XSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorsCustom.primaryColor.green),
          // textAlign: TextAlign.left,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
          child: Text(
            info.tr,
            style: TextStyleHeading.textH8SuperSmall.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
