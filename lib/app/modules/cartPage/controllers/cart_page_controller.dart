import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/network/response/cart_response.dart';
import 'package:herai/app/data/repositories/cart_repository.dart';
import 'package:herai/app/utils/log.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';

class CartPageController extends GetxController {
  RxBool selected = false.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  Rx<CartItem> item = CartItem.empty().obs;

  RxList<CartItem> itemsSelected = <CartItem>[].obs;

  RxBool checked = false.obs;

  RxInt totalWeight = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  Rx<Cart> cart = Cart.empty().obs;

  CartRepository _cartRepository = CartRepository();

  @override
  void onInit() async {
    // item.value = Get.arguments ?? Item.empty();
    // if (item.value.image.isNotEmpty) {
    //   items.add(item.value);
    // }

    // print('ITEM_date : ${item.value.toMap().toString()}');
    await getCart();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> refreshCart() async {
    await getCart();
  }

  Future<Cart> getCart() async {
    cart.value = await _cartRepository.getActiveChartRepository();
    Log.colorGreen('cart_value : ${cart.value.items.length}');

    if (cart.value.items.isNotEmpty) {
      items.value = cart.value.items;
      countTotal();
    }
    return cart.value;
  }

  Future<void> deleteCart(CartItem item) async {
    final success = await _cartRepository.delItem(item);
    if (success) getCart();
    Log.colorGreen('delete_cart success : $success');
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 20);
      if (image == null) return;

      // this.image = imageTemp;
      Log.info('result_camera : ${image.path}');
      Get.offNamed(Routes.IMAGE_RESULT_PAGE, arguments: {'path': image.path});
    } on PlatformException catch (e) {
      Log.info('Failed to pick image : $e');
    }
  }

  void changeValue(int index, bool val) {
    items[index].selected = val;
  }

  void countTotal() {
    itemsSelected.value = items.where((p0) => p0.selected == true).toList();

    Log.colorGreen('item_selected : ${itemsSelected.length}');

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
    Get.toNamed(Routes.GMAPS_PAGE,
        arguments: {"item_ids": itemsSelected.map((e) => e.id).toList()});
  }
}
