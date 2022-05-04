import 'package:get/get.dart';
import 'package:github_home_test/app/data/models/commits_model.dart';
import 'package:github_home_test/app/data/services/commits_service.dart';

class HomeController extends GetxController {
  List<Commits> commits = [];
  bool loading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadCommits();
  }
 

  void loadCommits() async {
    final CommitsService _service = Get.find<CommitsService>();
    var response = await _service.getService();
    commits = response['data'] as List<Commits>;
    loading = false;
    update(['commits']);
  }
}
