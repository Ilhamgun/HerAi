import 'dart:io';

import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/request/add_item.dart';
import 'package:herai/app/data/network/response/base_response.dart';
import 'package:herai/app/data/network/response/cart_response.dart';

import 'dart:async';

import 'package:herai/app/data/network/response/delete_item_response.dart';
import 'package:herai/app/utils/log.dart';

class CartRepository {
  late HerAiApi _api;

  CartRepository() {
    _api = HerAiApi();
  }

  Future<Cart> getActiveChartRepository() async {
    final response = await _api.getActiveCart(Urls.getActiveChart);

    final Cart data =
        baseResponseFromMap<Cart>(response, (p0) => Cart.fromMap(p0)).data;

    return data;
  }

  Future<bool> postAddItem(AddItem addItems) async {
    Log.info('post : ${addItems.toMap()}');
    final response = await _api.sendForm(Urls.postAddItem, {
      "item_id": addItems.itemid,
      "weight": addItems.weight,
    }, {
      'picture': addItems.picture!
    });
    Log.colorGreen(response);

    final success =
        baseResponseFromMap<String>(response, (p0) => p0.toString()).success;

    return success;
  }

  Future<bool> delItem(CartItem item) async {
    final response = await _api.delete(Urls.deleteItem(id: item.id.toString()));

    final success = baseResponseFromMap<DeleteItem>(
        response, (p0) => DeleteItem.fromMap(p0)).success;
    return success;
  }

  Future<bool> uploadScale(File file) async {
    Log.colorGreen('UPLOAD SCALE');
    final response =
        await _api.postMultipart(Urls.uploadScales, {}, {"picture": file});
    return baseResponseFromMap<String>(response, (p0) => p0.toString()).success;
  }
}
