import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:github_home_test/app/routes/app_pages.dart';
import 'package:github_home_test/app/ui/pages/home_page/bindings/home_binding.dart';
import 'package:github_home_test/app/ui/pages/home_page/home_page.dart';
import 'package:github_home_test/app/ui/theme/app_theme.dart';
import 'package:github_home_test/app/ui/utils/dependency_injection.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  setPathUrlStrategy();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Github Home Test Commits',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: AppTheme.themeData,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
