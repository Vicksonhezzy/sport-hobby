import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/presentation/log_in_screen/models/log_in_model.dart';

import '../../../core/network/http_calls.dart';
import '../../../core/utils/progress_dialog_utils.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late BuildContext contexts;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
  }

  onTap() async {
    if (formKey.currentState!.validate()) {
      showProgressDialog();
      var body = {
        "userId": user.id,
        "oldPassword": oldPasswordController.text,
        "newPassword": newPasswordController.text,
      };
      var res = await httpPost(
          url: 'users/updatePassword/', body: body, context: contexts);
      if (res['success']) {
        var data = res['data'];
        if (data['success']) {
          Get.back();
          showCustomDialog(
              msg: data['message'],
              onTap: () => Get
                ..back()
                ..back(),
              isCancellable: true);
          return;
        }
        Get.back();
        throw data['message'];
      }
      Get.back();
    }
  }
}
