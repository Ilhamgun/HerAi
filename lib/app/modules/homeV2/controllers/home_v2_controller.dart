import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/data_source/shared_pref_secure_storage.dart';
import 'package:herai/app/data/network/response/cart_response.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';
import 'package:herai/app/data/repositories/cart_repository.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/extensions.dart';
import 'package:herai/app/utils/log.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/entities/model_result.dart';
import '../../../data/entities/user.dart';

class HomeV2Controller extends GetxController {
  AuthRepository authRepository = Get.find<AuthRepository>();
  RxInt currentIndex = 0.obs;
  RxBool isLoading = true.obs;
  Rx<UserProfile> user = UserProfile.empty().obs;

  Rx<ModelResult> status = ModelResult(
    confidence: 0.0,
    index: 0,
    label: "camera_result_recyclable",
  ).obs;

//CART
  CartRepository _cartRepository = CartRepository();
  RxBool selected = false.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  Rx<CartItem> item = CartItem.empty().obs;

  RxList<CartItem> itemsSelected = <CartItem>[].obs;

  RxBool checked = false.obs;

  RxInt totalWeight = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  Rx<Cart> cart = Cart.empty().obs;

  int locationFlag = 0;
  SharedPrefSecureStorage? pref = SharedPrefSecureStorage.getInstance();

  @override
  void onInit() async {
    user.value = await getUser();
    await getCart();

    isLoading.value = false;

    locationFlag = await pref?.getLocationFlag() ?? 0;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void gotoMenu(int page) {
    currentIndex.value = page;
    if (page == 1) getCart();
    update(['baseMenuView']);
  }

  void gotoSettings() {
    Get.toNamed(Routes.SETTINGS_PAGE, arguments: {'user': user.value});
  }

  void gotoNotif() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  void gotoHistoryTransaction() {
    Get.toNamed(Routes.HISTORY_TRANSACTION_PAGE,
        arguments: {'user': user.value});
  }

  Future<UserProfile> getUser() async {
    try {
      if (user.value.name.isEmpty)
        user.value = await authRepository.getUserData();
    } catch (e) {
      Log.error('INI ERROR NYA : $e');
    }
    Log.colorGreen('GET_USER : ${user.value.name}');
    return user.value;
  }

  Future<void> changeImage(BuildContext context,
      {required bool picProfile, required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      var response =
          await postImage(picFor: picProfile, file: File(image.path));
      if (response) {
        final snackBar = SnackBar(
          content: Text("Upload Successfully"),
          duration: Duration(milliseconds: 500),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<bool> postImage({required bool picFor, required File file}) async {
    var response = false;
    if (picFor) {
      var profile = {
        '_method': 'PATCH',
        'name': '${user.value.name}',
        'email': '${user.value.email}',
      };

      response = await authRepository.postEditProfile(profile, file);
      user.value = response ? await getUser() : user.value;
    } else {
      response = await _cartRepository.uploadScale(file);
    }
    return response;
  }

  Future<void> refreshCart() async {
    await getCart();
  }

  Future<Cart> getCart() async {
    cart.value = await _cartRepository.getActiveChartRepository();
    totalWeight.value = 0;
    totalPrice.value = 0;
    if (cart.value.items.isNotEmpty) {
      items.value = cart.value.items;
      countTotal();
    }
    return cart.value;
  }

  Future<void> deleteCart(CartItem item) async {
    isLoading.value = true;
    final success = await _cartRepository.delItem(item);
    if (success) getCart();
    Log.colorGreen('delete_cart success : $success');
    isLoading.value = false;
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 20);
      if (image == null) return;

      // final imageTemp = File(image.path);
      // this.image = imageTemp;
      Log.info('result_camera : ${image.path}');
      Get.toNamed(Routes.IMAGE_RESULT_PAGE, arguments: {'path': image.path});
    } on PlatformException catch (e) {
      Log.info('Failed to pick image : $e');
    }
  }

  void changeValue(int index, bool val) {
    items[index].selected = val;
  }

  void countTotal() {
    itemsSelected.value = items.where((p0) => p0.selected == true).toList();

    totalWeight.value = items.map(
      (item) {
        int _weight = 0;
        if (item.selected) {
          _weight += item.weight;
        }

        return _weight;
      },
    ).reduce((value, current) => value + current);

    totalPrice.value = items.map(
      (item) {
        double _hp = 0;
        if (item.selected) {
          _hp += item.price;
        }

        return _hp;
      },
    ).reduce((value, current) => value + current);
  }

  void pindahKeAngkut() {
    if (locationFlag == 0) {
      Get.showOkDialog(
          title: 'location_dialog_title'.tr,
          content: 'location_dialog_content'.tr,
          () => {
                Get.back(),
                // Get.errorSnackBar("test", "test")
                Get.toNamed(Routes.GMAPS_PAGE, arguments: {
                  "item_ids": itemsSelected.map((e) => e.id).toList()
                }),
                pref?.saveLocationFlag(1)
              });
    } else {
      Get.toNamed(Routes.GMAPS_PAGE,
          arguments: {"item_ids": itemsSelected.map((e) => e.id).toList()});
    }
  }
}
