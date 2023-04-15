import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/custom_button.dart';
import 'package:sportbuddy/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    contexts = context;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray100,
        body: Form(
          key: controller.formKey,
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 29,
                  ),
                  child: Text(
                    "Forgot Password".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold24,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 43,
                      top: 12,
                    ),
                    child: Text(
                      "Enter Email Address".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium10,
                    ),
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.emailController,
                  margin: getMargin(
                    left: 41,
                    top: 4,
                    right: 40,
                  ),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomButton(
                  height: getVerticalSize(
                    47,
                  ),
                  onTap: () => controller.onTap(Get.arguments),
                  text: "Continue".tr,
                  margin: getMargin(
                    left: 38,
                    top: 32,
                    right: 43,
                    bottom: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
