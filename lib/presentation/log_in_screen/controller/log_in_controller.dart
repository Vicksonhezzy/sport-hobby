import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/network/http_calls.dart';
import 'package:sportbuddy/presentation/log_in_screen/models/log_in_model.dart';

import '../../../core/utils/progress_dialog_utils.dart';

class LogInController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late BuildContext contexts;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // emailController.dispose();
    // passwordController.dispose();
  }

  onLogin() async {
    if (formKey.currentState!.validate()) {
      showProgressDialog();
      var body = {
        "username": emailController.text.trim(),
        "password": passwordController.text,
      };
      var res =
          await httpPost(url: 'users/login', body: body, context: contexts);
      if (res['success']) {
        print('res = $res');
        var data = res['data'];
        if (data['success']) {
          user = UserModel.fromJson(data);
          Get.back();
          if (user.emailVerified!) {
            Get.toNamed(AppRoutes.dashboardScreen);
          } else {
            showCustomDialog(
              msg: 'Email not verified',
              onTap: () => Get.back(),
            );
          }
          return;
        }
        Get.back();
        throw data['message'];
      }
      Get.back();
    }
  }

  onSignUp() async {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen, arguments: false);
  }
}
