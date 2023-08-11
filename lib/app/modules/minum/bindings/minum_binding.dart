import 'package:get/get.dart';

import '../controllers/minum_controller.dart';

class MinumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MinumController>(
      () => MinumController(),
    );
  }
}
