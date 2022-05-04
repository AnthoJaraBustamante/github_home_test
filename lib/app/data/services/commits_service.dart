import 'package:get/instance_manager.dart';
import 'package:github_home_test/app/data/provider/commits_api.dart';

class CommitsService {
  final CommitsApi _api =Get.find<CommitsApi>();

  Future<Map<String, dynamic>> getService() async => _api.getApi();
}
