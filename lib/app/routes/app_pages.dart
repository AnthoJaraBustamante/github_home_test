import 'package:get/get.dart';
import 'package:github_home_test/app/routes/app_routes.dart';
import 'package:github_home_test/app/ui/pages/home_page/bindings/home_binding.dart';
import 'package:github_home_test/app/ui/pages/home_page/home_page.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
