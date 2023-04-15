import '../controller/update_password_controller.dart';
import 'package:get/get.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePasswordController());
  }
}
