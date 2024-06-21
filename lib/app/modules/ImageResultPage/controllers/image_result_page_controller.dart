import 'dart:io';

import 'package:get/get.dart';
import 'package:herai/app/data/entities/model_result_cloud.dart';
import 'package:herai/app/data/network/request/add_item.dart';

import 'package:herai/app/data/repositories/cart_repository.dart';

import 'package:herai/app/data/usecase/classify_image_case.dart';

import '../../../routes/app_pages.dart';

class ImageResultPageController extends GetxController {
  RxBool isLoading = true.obs;
  RxString path = ''.obs;
  RxInt weight = 0.obs;
  int price = 10000;

  String resultLabel = 'Sampah Daur Ulang';

  Rx<ModelResultCloud> status = ModelResultCloud(
          classEnum: "camera_result_recyclable", confidenceLevel: 0.0)
      .obs;

  final classifyImageCase = Get.put(ClassifyImageCase());

  Rx<AddItem> addItem = AddItem.empty().obs;
  CartRepository _cartRepository = CartRepository();
  @override
  void onInit() async {
    super.onInit();
    path.value =
        Get.arguments['path']; //?? 'assets/images/image_not_founded.png';
    // status.value = Get.arguments['status'];
    // print('image_path: ${image!.path}');

    addItem.value.picture = File(path.value);

    print('image_Temp: ${path.value}');

    // await classifyImageCase
    //     .postModel(File(path.value))
    //     .then((value) => {status.value = value});

    classifyImageCase
        .runModel(path.value)
        .then((value) => {status.value = value});

    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void addWeight() {
    weight.value++;
  }

  void subWeight() {
    if (weight.value > 0) weight.value--;
  }

  void addToCart(AddItem addItem) async {
    final item = await _cartRepository.postAddItem(addItem);

    if (item) {
      Get.offNamed(
        Routes.CART_PAGE,
      );
    }
  }
}
