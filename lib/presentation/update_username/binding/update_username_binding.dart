import '../controller/update_username_controller.dart';
import 'package:get/get.dart';

class UpdateUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateUsernameController());
  }
}
