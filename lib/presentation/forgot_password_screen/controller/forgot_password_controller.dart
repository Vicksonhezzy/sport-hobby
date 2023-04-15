import 'package:sportbuddy/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/utils/progress_dialog_utils.dart';
import 'package:sportbuddy/presentation/log_in_screen/models/log_in_model.dart';

import '../../../core/network/http_calls.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late BuildContext contexts;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  onTap(bool isUpdate) async {
    if (formKey.currentState!.validate()) {
      showProgressDialog();
      if (isUpdate) {
        var body = {
          "userId": user.id,
          "email": emailController.text.trim(),
        };
        var res = await httpPost(
            url: 'users/updateEmail', body: body, context: contexts);
        if (res['success']) {
          var data = res['data'];
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
      } else {
        var res = await httpGet(
            url: 'users/forgotPassword/${emailController.text}',
            context: contexts);
        if (res['success']) {
          var data = res['data'];
          if (data['success']) {
            Get.back();
            showCustomDialog(
                msg: data['message'],
                onTap: () => Get.offAllNamed(AppRoutes.logInScreen));
            return;
          }
          Get.back();
          throw data['message'];
        }
        Get.back();
      }
    }
  }
}
