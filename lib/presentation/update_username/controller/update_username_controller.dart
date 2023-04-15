import 'dart:convert';

import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_calls.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../log_in_screen/models/log_in_model.dart';

class UpdateUsernameController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
  }

  onTap() async {
    showProgressDialog();
    if (formKey.currentState!.validate()) {
      var body = {
        "userId": user.id,
        "username": usernameController.text,
      };
      var res = await httpPost(url: 'users/updateUserName', body: body);
      if (res['success']) {
        var data = json.decode(res['data']);
        if (data['success']) {
          Get.back();
          showCustomDialog(
              msg: data['message'],
              onTap: () => Get
                ..back()
                ..back());
          return;
        }
        Get.back();
        throw data['message'];
      }
      Get.back();
    }
  }
}
