import 'dart:io';

import 'package:get/get.dart';
import 'package:herai/app/data/entities/herai_point.dart';
import 'package:herai/app/data/entities/model_sampah.dart';
import 'package:herai/app/data/network/request/add_item.dart';
import 'package:herai/app/data/repositories/cart_repository.dart';
import 'package:herai/app/data/repositories/pickup_repository.dart';
import 'package:herai/app/data/repositories/trash_repository.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/utils/log.dart';

class PilihSampahController extends GetxController {
  HomeV2Controller baseController = Get.find<HomeV2Controller>();
  RxList<TrashResult> dataSampah = <TrashResult>[].obs;
  Rx<TrashResult> selectedTrash = TrashResult.empty().obs;

  Rx<HerAiPoint> selectedHerAiPoint = HerAiPoint.empty().obs;
  RxList<HerAiPoint> listHerAiPoint = <HerAiPoint>[].obs;

  CartRepository _cartRepository = CartRepository();
  TrashRepository _trashRepository = TrashRepository();
  PickupRepository _pickUpRepository = PickupRepository();

  File? fileImage;

  @override
  void onInit() async {
    String path = Get.arguments == null ? '' : Get.arguments['imagePath'];
    Log.colorGreen('path : ${path}');
    if (path.isNotEmpty) fileImage = File(path);

    Log.colorGreen('listHerAiPoint : ${listHerAiPoint.length}');
    listHerAiPoint.value = await getListHeraiPoint();

    if (listHerAiPoint.isNotEmpty) {
      await setSelectedHeraiPoint(listHerAiPoint.value.first);
      Log.colorGreen('data_smapah : ${dataSampah.length}');
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<HerAiPoint>> getListHeraiPoint() async {
    final data = await _pickUpRepository.getPoints();
    Log.colorGreen('listHerAiPoint : ${listHerAiPoint.length}');
    return data;
  }

  Future<void> setSelectedHeraiPoint(HerAiPoint heraiPoint) async {
    selectedHerAiPoint.value = heraiPoint;
    dataSampah.clear();
    selectedTrash.value = TrashResult.empty();
    dataSampah.value = await getTrash(heraiPoint);
  }

  Future<List<TrashResult>> getTrash(HerAiPoint herAiPoint) async {
    var data = await _trashRepository.getTrash(herAiPoint.id);

    return data;
  }

  void setSelectedKategori(TrashResult dataSampah) {
    selectedTrash.value = dataSampah;
  }

  void addWeight(Trash trashSelected) {
    trashSelected.weight++;
    selectedTrash.refresh();
  }

  void subWeight(Trash trashSelected) {
    if (trashSelected.weight > 0) trashSelected.weight--;
    selectedTrash.refresh();
  }

  void addToCart(AddItem addItem) async {
    Log.colorGreen('item : ${addItem.itemid}');
    final item = await _cartRepository.postAddItem(addItem);
    if (item) {
      // Get.offNamed(
      //   Routes.CART_PAGE,
      // );
      Get.back();
      Get.back();
      baseController.gotoMenu(1);
    }
  }
}
