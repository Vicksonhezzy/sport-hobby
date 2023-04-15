import 'controller/update_username_controller.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/custom_button.dart';
import 'package:sportbuddy/widgets/custom_text_form_field.dart';

class UpdateUsernameScreen extends GetWidget<UpdateUsernameController> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 85,
                    top: 30,
                  ),
                  child: Text(
                    "Update Username".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold24,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 43,
                    top: 13,
                  ),
                  child: Text(
                    "Enter New Username".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium10,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.usernameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Field required' : null,
                  margin: getMargin(
                    left: 41,
                    top: 3,
                    right: 40,
                  ),
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.center,
                ),
                CustomButton(
                  height: getVerticalSize(
                    47,
                  ),
                  text: "Confirm".tr,
                  onTap: () => controller.onTap(),
                  margin: getMargin(
                    left: 38,
                    top: 32,
                    right: 43,
                    bottom: 5,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
