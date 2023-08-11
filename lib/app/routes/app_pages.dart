import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/minum/bindings/minum_binding.dart';
import '../modules/minum/views/minum_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MINUM,
      page: () => const MinumView(),
      binding: MinumBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
