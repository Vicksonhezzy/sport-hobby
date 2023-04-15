import 'package:sportbuddy/core/app_export.dart';

class OnboardingController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.logInScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
