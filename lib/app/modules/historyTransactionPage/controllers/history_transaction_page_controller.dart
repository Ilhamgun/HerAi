import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/entities/transaction_data.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/response/base_list_response.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../../../data/entities/user.dart';

class HistoryTransactionPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AuthRepository authRepository = Get.find<AuthRepository>();

  HerAiApi _api = HerAiApi();

  RxList<TransactionData> transactionWaiting = <TransactionData>[].obs;

  RxList<TransactionData> transactionSuccess = <TransactionData>[].obs;

  Rx<int> choosebar = 0.obs;
  late TabController tabController;

  Rx<UserProfile> user = UserProfile.empty().obs;

  void getTransactionData() async {
    var response = await _api.get(Urls.getAllTransaction);
    List<TransactionData> transactionData =
        baseListResponseFromMap<TransactionData>(
            response, (p0) => TransactionData.fromMap(p0)).data;
    this.transactionWaiting.value = transactionData
        .where((element) => element.status == "waiting")
        .toList();
    this.transactionSuccess.value = transactionData
        .where((element) => element.status != "waiting")
        .toList();
  }

  @override
  void onInit() async {
    user.value = Get.arguments['user'];
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: Duration.zero,
    );
    tabController.addListener(() {
      choosebar.value = tabController.index;
    });

    //get.all history
    getTransactionData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
  }

  void onTapChooseBar(int value) {
    choosebar.value = value;
    // pageController.animateToPage(
    //   value,
    //   duration: const Duration(milliseconds: 350),
    //   curve: Curves.easeInOutQuint,
    // );
  }

  Future<bool> willPop(BuildContext context) async {
    // FocusScope.of(context).unfocus();
    // Get.offAllNamed(Routes.HOME);
    // print('GotoHome');

    return true;
  }

// Future<HistoryTranscation> getHistoryTransaction() async {
//   cart.value = await _cartRepository.getActiveChartRepository();
//   Log.colorGreen('cart_value : ${cart.value.items.length}');

//   if (cart.value.items.isNotEmpty) {
//     items.value = cart.value.items;
//     countTotal();
//   }
//   return cart.value;
// }
}
