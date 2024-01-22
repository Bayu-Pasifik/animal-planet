import 'package:get/get.dart';

import '../modules/DetailContent/bindings/detail_content_binding.dart';
import '../modules/DetailContent/views/detail_content_view.dart';
import '../modules/SearchContent/bindings/search_content_binding.dart';
import '../modules/SearchContent/views/search_content_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CONTENT,
      page: () => const DetailContentView(),
      binding: DetailContentBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_CONTENT,
      page: () => const SearchContentView(),
      binding: SearchContentBinding(),
    ),
  ];
}
