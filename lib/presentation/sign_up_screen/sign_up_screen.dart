import 'package:sportbuddy/widgets/random_widgets..dart';

import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/core/utils/validation_functions.dart';
import 'package:sportbuddy/widgets/custom_button.dart';
import 'package:sportbuddy/widgets/custom_text_form_field.dart';

class SignUpScreen extends GetWidget<SignUpController> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: getMargin(
                      top: 45,
                    ),
                    child: appText,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    // left: 42,
                    top: 44,
                  ),
                  child: Text(
                    "Sign Up Here".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold20,
                  ),
                ),
                Container(
                  child: Text(
                    "Please enter your details to create your account".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular10,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.usernameController,
                  hintText: "Enter Username".tr,
                  margin: getMargin(
                    left: 41,
                    top: 20,
                    right: 40,
                  ),
                  // variant: TextFormFieldVariant.None,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter username";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.emailController,
                  hintText: "Enter Email Address".tr,
                  margin: getMargin(
                    left: 41,
                    top: 20,
                    right: 40,
                  ),
                  // variant: TextFormFieldVariant.None,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.numberController,
                  hintText: "Enter Phone Number".tr,
                  margin: getMargin(
                    left: 41,
                    top: 12,
                    right: 40,
                  ),
                  // variant: TextFormFieldVariant.None,
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.passwordController,
                  hintText: "Enter Password".tr,
                  margin: getMargin(
                    left: 41,
                    top: 12,
                    right: 40,
                  ),
                  // variant: TextFormFieldVariant.None,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid password";
                    }
                    return null;
                  },
                  isObscureText: true,
                ),
                GetBuilder<SignUpController>(builder: (context) {
                  return Column(
                    children: [
                      DropDown(
                        items: <String>[
                          'Football',
                          'Basketball',
                          'Ice hockey',
                          'MotorSports',
                          'Nandy',
                          'Rugby',
                          'Skiing',
                          'Shooting'
                        ],
                        onChanged: controller.onChanged,
                        value: controller.initialValue,
                      ),
                      interest(controller),
                    ],
                  );
                }),
                CustomButton(
                  height: getVerticalSize(
                    47,
                  ),
                  onTap: () => controller.onTap(),
                  text: "Continue".tr,
                  margin: getMargin(
                    left: 41,
                    top: 33,
                    right: 40,
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

  Widget interest(SignUpController controller) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          left: 41,
          top: 12,
          right: 37,
          bottom: 5,
        ),
        child: GridView.builder(
          itemCount: controller.interest.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 3),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                interestContainer(name: controller.interest[index]),
                Positioned(
                  top: -15,
                  right: -15,
                  child: IconButton(
                    onPressed: () =>
                        controller.removeInterest(controller.interest[index]),
                    icon:
                        Icon(Icons.clear, size: getSize(30), color: Colors.red),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
