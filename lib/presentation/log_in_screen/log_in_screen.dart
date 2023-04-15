import 'package:sportbuddy/widgets/random_widgets..dart';

import 'controller/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/custom_button.dart';
import 'package:sportbuddy/widgets/custom_text_form_field.dart';

class LogInScreen extends GetWidget<LogInController> {
  @override
  Widget build(BuildContext context) {
    controller.contexts = context;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray100,
        body: Form(
          key: controller.formKey,
          child: Container(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                    height: getVerticalSize(
                      41,
                    ),
                    width: getHorizontalSize(
                      187,
                    ),
                    alignment: Alignment.center,
                    margin: getMargin(
                      top: 50,
                      // right: 90,
                    ),
                    child: appText),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      top: 43,
                    ),
                    child: Text(
                      "Log in here".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold20,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Text(
                      "Please enter your details to log into your account".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular10,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 43,
                      top: 31,
                    ),
                    child: Text(
                      "Enter Email/Phone NUmber".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium10,
                    ),
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.emailController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Field required' : null,
                  margin: getMargin(
                    left: 41,
                    top: 4,
                    right: 40,
                  ),
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 43,
                      top: 31,
                    ),
                    child: Text(
                      "Enter Password".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium10,
                    ),
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.passwordController,
                  margin: getMargin(
                    left: 41,
                    top: 4,
                    right: 40,
                  ),
                  // variant: TextFormFieldVariant.None,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  alignment: Alignment.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid password";
                    }
                    return null;
                  },
                  isObscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => controller.onForgotPassword(),
                    child: Container(
                      padding: getPadding(top: 12, right: 40),
                      child: Text(
                        "Forgot Password?".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: AppStyle.txtPoppinsSemiBold12,
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(
                    47,
                  ),
                  text: "Log In".tr,
                  onTap: () => controller.onLogin(),
                  margin: getMargin(
                    left: 41,
                    top: 17,
                    right: 40,
                  ),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: getPadding(
                    top: 22,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?".tr,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.onSignUp(),
                        child: Text(
                          "Sign Up".tr,
                          style: TextStyle(
                            color: ColorConstant.teal300,
                            decoration: TextDecoration.underline,
                            fontSize: getFontSize(
                              15,
                            ),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
