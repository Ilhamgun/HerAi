import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:herai/app/modules/gmapsPage/views/bottomSheet.dart';

import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/utils/log.dart';

import '../controllers/gmaps_page_controller.dart';

class GmapsPageView extends GetView<GmapsPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   title: Text('GmapsPageView'),
        //   centerTitle: true,
        // ),
        body: controller.isloading.isTrue
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // controller.currentLocation == null
                    //     ? Container(
                    //         margin: EdgeInsets.symmetric(vertical: 150),
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       )
                    //     :

                    Obx(
                      () => Container(
                        width: Get.width,
                        height: Get.height,
                        child: GoogleMap(
                          onTap: (position) {
                            // showModalBottomSheet(
                            //     isScrollControlled: true,
                            //     context: context,
                            //     builder: (context) {
                            //       return BottomGmapsInfo();
                            //     });
                            // Get.bottomSheet(
                            //   // _bottomInfo(controller.allPoints.value, true),
                            //   BottomGmapsInfo(),
                            //   elevation: 0,
                            //   ignoreSafeArea: true,
                            //   isScrollControlled: true,
                            // );
                          },
                          myLocationButtonEnabled: true,
                          // myLocationEnabled: true,
                          zoomGesturesEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: controller.destinationLocation.value,
                            zoom: 10.5,
                          ),
                          polylines: //controller.poliLine,
                              {
                            Polyline(
                              polylineId: PolylineId('route'),
                              points: List<LatLng>.from(
                                  controller.polylineCoordinates),
                              color: ColorsCustom.primaryColor.green,
                              width: 4,
                            )
                          },
                          markers: {
                            Marker(
                                markerId: MarkerId('My Location'),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueRed),
                                position: LatLng(
                                  controller.originLocation.value.latitude,
                                  controller.originLocation.value.longitude,
                                ),
                                draggable: true,
                                onDragEnd: (pin) {
                                  controller.originLocation.value = pin;
                                  controller.getPolyPoints(
                                      controller.destinationLocation.value);
                                  print(
                                      'current_location : ${controller.originLocation.value.latitude}, long: ${controller.originLocation.value.longitude}');
                                },
                                onTap: () {
                                  Get.bottomSheet(
                                    // _bottomInfo(controller.allPoints.value, true),
                                    BottomGmapsInfo(),
                                    elevation: 0,
                                    ignoreSafeArea: true,
                                    isScrollControlled: true,
                                  );
                                }),
                          }.union(controller.allPoints.map((element) {
                            Log.colorGreen(
                                'mapping_list coordinate: ${element.coordinate}');
                            return Marker(
                                markerId: MarkerId(element.name),
                                position: LatLng(
                                  element.latitude,
                                  element.longitude,
                                ),
                                infoWindow: InfoWindow(
                                    title: element.name,
                                    snippet: element.address),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueGreen),
                                // controller.destinationLocation.value,
                                onTap: () async {
                                  controller.destinationLocation.value = LatLng(
                                    element.latitude,
                                    element.longitude,
                                  );
                                  Log.colorGreen(
                                      'mapping_list selected: ${element.coordinate}');

                                  await controller.getPolyPoints(
                                      controller.destinationLocation.value);
                                  controller.nearestPoint.value = element;
                                  Get.bottomSheet(
                                    // _bottomInfo(controller.allPoints.value, true),

                                    BottomGmapsInfo(),
                                    elevation: 0,
                                    ignoreSafeArea: true,
                                    isScrollControlled: true,
                                  );
                                });
                          }).toSet()),
                          onLongPress: controller.addMarker,
                        ),
                      ),
                    ),

                    // _bottomInfo()
                  ],
                ),
              ),
      ),
    );
  }
}
