import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/data/entities/herai_point.dart';
import 'package:herai/app/data/network/request/add_item.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/utils/log.dart';
import 'package:herai/app/widgets/dropdown.dart/dropdown_custom.dart';

import '../controllers/pilih_sampah_controller.dart';

class PilihSampahView extends GetView<PilihSampahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leadingWidth: 60,
        title: Text('pilih_sampah_title'.tr),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xfB50C346),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('List Harga :'),
                  Obx(() => DropdownCustom<HerAiPoint>(
                        selectedValue:
                            controller.selectedHerAiPoint.value.name.isEmpty
                                ? null
                                : controller.selectedHerAiPoint.value,
                        noTitle: true,
                        label: '',
                        hint: 'Tidak Ada Bank Sampah',
                        onChanged: (value) {
                          controller.setSelectedHeraiPoint(value!);
                        },
                        listItems: controller.listHerAiPoint.isEmpty
                            ? []
                            : controller.listHerAiPoint
                                .map((heraiPoint) =>
                                    DropdownMenuItem<HerAiPoint>(
                                      value: heraiPoint,
                                      child: Text(
                                        heraiPoint.name,
                                      ),
                                    ))
                                .toList(),
                      )),
                ],
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.dataSampah
                          .map(
                            (e) => GestureDetector(
                              onTap: () => controller.setSelectedKategori(e),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(
                                    right: controller.dataSampah.last == e
                                        ? 0
                                        : 10),
                                decoration: BoxDecoration(
                                    color: e.category ==
                                            controller
                                                .selectedTrash.value.category
                                        ? ColorsCustom.primaryColor.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color:
                                            ColorsCustom.primaryColor.green)),
                                child: Text(
                                  e.category,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: e.category ==
                                            controller
                                                .selectedTrash.value.category
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()),
                ),
              ),
            ),
            SizedBox(height: 24),
            Obx(() => Column(
                  children: controller.selectedTrash.value.trashs
                      .map(
                        (trash) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: GestureDetector(
                            onTap: () =>
                                null, //controller.setSelectedKategori(e),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: ColorsCustom.primaryColor.green)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250,
                                          child: Text(
                                            trash.name,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '${trash.price.toString()} HC/Kg',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(height: 14),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(),
                                                icon: Icon(
                                                  Icons.add_circle,
                                                ),
                                                color: ColorsCustom
                                                    .primaryColor.green,
                                                onPressed: () =>
                                                    controller.addWeight(trash),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      4,
                                                    )),
                                                child: Text('${trash.weight}'),
                                              ),
                                              IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(),
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                ),
                                                color: ColorsCustom
                                                    .primaryColor.green,
                                                onPressed: () =>
                                                    controller.subWeight(trash),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Visibility(
                                      visible: trash.weight > 0,
                                      child: ElevatedButton(
                                        onPressed: trash.weight > 0
                                            ? () {
                                                Log.colorGreen(
                                                    'weight : ${trash.weight}');

                                                var addItem = AddItem(
                                                    itemid: trash.id,
                                                    weight:
                                                        trash.weight.toString(),
                                                    picture:
                                                        controller.fileImage);

                                                Log.colorGreen(
                                                    'weight object : ${trash.weight}');

                                                controller.addToCart(addItem);
                                              }
                                            : () {
                                                Log.colorGreen(
                                                    'weight object : ${trash.weight}');
                                              },
                                        child: Text('pilih_sampah_tambah'.tr,
                                            style: TextStyle(fontSize: 12)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )),
          ],
        ),
      ),
    );
  }
}
