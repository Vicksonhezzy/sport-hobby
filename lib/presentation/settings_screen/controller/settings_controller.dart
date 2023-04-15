import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/utils/progress_dialog_utils.dart';

class SettingsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onForgortPassword() {
    Get.toNamed(AppRoutes.updatePasswordScreen);
  }

  onUpdateEmail() {
    Get.toNamed(AppRoutes.forgotPasswordScreen, arguments: true);
  }

  onUpdateUser() {
    Get.toNamed(AppRoutes.updateUsernameScreen);
  }

  logOut() {
    showCustomDialog(
        isCancellable: true,
        msg: 'Are you sure you want to log out',
        onTap: () {
          Get.offAllNamed(AppRoutes.logInScreen);
          // Navigator.of(contexts).pushAndRemoveUntil(
          //     MaterialPageRoute(
          //       builder: (context) => LogInScreen(),
          //     ),
          //     (route) => false);
        });
  }
}
