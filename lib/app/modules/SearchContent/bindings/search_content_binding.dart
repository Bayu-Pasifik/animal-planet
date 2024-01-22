import 'package:get/get.dart';

import '../controllers/search_content_controller.dart';

class SearchContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchContentController>(
      () => SearchContentController(),
    );
  }
}
