import 'package:get/get.dart';

import '../controllers/pilih_sampah_controller.dart';

class PilihSampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihSampahController>(
      () => PilihSampahController(),
    );
  }
}
