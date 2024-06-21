import 'package:get/get.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';

import '../controllers/history_transaction_page_controller.dart';

class HistoryTransactionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryTransactionPageController>(
      () => HistoryTransactionPageController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
