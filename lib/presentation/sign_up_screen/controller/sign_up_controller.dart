import 'dart:convert';

import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_calls.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../log_in_screen/models/log_in_model.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? initialValue;

  List interest = [];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    numberController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  onChanged(String? value) {
    if (!interest.contains(value)) {
      interest.add(value);
    }
    // initialValue = value;
    update();
  }

  removeInterest(String value) {
    interest.remove(value);
    update();
  }

  onTap() async {
    if (formKey.currentState!.validate() && interest.isNotEmpty) {
      showProgressDialog();
      var body = {
        "username": usernameController.text,
        "number": numberController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "interest": interest,
      };
      var res = await httpPost(url: 'users/registration', body: body);
      if (res['success']) {
        user = UserModel.fromJson(json.decode(res['data']));
        String number;
        if (!numberController.text.startsWith("+234")) {
          number = "+234" + numberController.text.trim();
        } else {
          number = numberController.text.trim();
        }
        var body = {
          "id": user.id,
          "number": number,
        };
        var _res =
            await httpPost(url: 'users/sendPhoneVerificationCode', body: body);
        if (_res['success']) {
          Get.back();
          Get.toNamed(AppRoutes.otpVerificationScreen);
          return;
        }
      }
      Get.back();
    }
  }
}
