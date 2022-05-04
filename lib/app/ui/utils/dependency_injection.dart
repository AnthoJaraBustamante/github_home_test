import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:github_home_test/app/data/network/base_url.dart';
import 'package:github_home_test/app/data/provider/commits_api.dart';
import 'package:github_home_test/app/data/services/commits_service.dart';

class DependencyInjection {
  static void init() {
    Get.put(Dio(BaseOptions(baseUrl: ApiBaseURL.baseUrl)));
    //PROVIDERS
    Get.put(CommitsApi());
    //SERVICES
    Get.put(CommitsService());
  }
}
