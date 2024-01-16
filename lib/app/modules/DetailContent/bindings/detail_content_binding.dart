import 'package:get/get.dart';

import '../controllers/detail_content_controller.dart';

class DetailContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailContentController>(
      () => DetailContentController(),
    );
  }
}
