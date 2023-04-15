import 'dart:convert';

import 'package:sportbuddy/core/app_export.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/utils/progress_dialog_utils.dart';
import 'package:sportbuddy/presentation/log_in_screen/models/log_in_model.dart';

import '../../../core/network/http_calls.dart';

class OtpVerificationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
    showCustomDialog(
      isCancellable: true,
      msg: 'An email verification link has been sent to your email address',
      onTap: () => Get.back(),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  onConfirm() async {
    if (otpController.value.text.isNotEmpty) {
      showProgressDialog();
      var body = {
        "id": user.id,
        "code": otpController.value.text,
      };
      var res = await httpPost(url: 'users/verifyCode', body: body);
      if (res['success']) {
        var data = json.decode(res['data']);
        if (data['success']) {
          Get
            ..back()
            ..back()
            ..back()
            ..toNamed(AppRoutes.logInScreen);
          return;
        }
        Get.back();
        throw data['message'];
      }
      Get.back();
    }
  }
}
