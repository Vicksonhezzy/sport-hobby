import 'dart:convert';

import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/network/http_calls.dart';
import 'package:sportbuddy/presentation/log_in_screen/models/log_in_model.dart';

import '../../../core/utils/progress_dialog_utils.dart';

class LogInController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  onLogin() async {
    if (formKey.currentState!.validate()) {
      showProgressDialog();
      var body = {
        "username": emailController.text.trim(),
        "password": passwordController.text,
      };
      var res = await httpPost(url: 'users/login', body: body);
      if (res['success']) {
        var data = json.decode(res['data']);
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
