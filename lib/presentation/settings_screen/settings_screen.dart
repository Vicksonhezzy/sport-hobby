import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/custom_text_form_field.dart';

class Settings extends StatelessWidget {
  SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    // left: 54,
                    top: 30,
                  ),
                  child: Text(
                    "Settings & Privacy".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtPoppinsSemiBold18,
                  ),
                ),
              ),
              container(
                text: "Change Password",
                top: 30,
                onTap: () => controller.onForgortPassword(),
              ),
              container(
                text: "Update Email",
                onTap: () => controller.onUpdateEmail(),
              ),
              container(
                text: "Update Username",
                onTap: () => controller.onUpdateUser(),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    top: 97,
                  ),
                  child: InkWell(
                    onTap: () => controller.logOut(),
                    child: Text(
                      "Log Out".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtPoppinsSemiBold12Red700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget container(
          {required String text, required Function onTap, double? top}) =>
      Container(
        height: getVerticalSize(
          27,
        ),
        width: getHorizontalSize(
          298,
        ),
        margin: getMargin(
          top: top ?? 21,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            InkWell(
              onTap: () => onTap(),
              child: CustomTextFormField(
                width: getHorizontalSize(
                  298,
                ),
                hintText: text.tr,
                enabled: false,
                variant: TextFormFieldVariant.UnderLineBlack9004c,
                fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                textInputType: TextInputType.visiblePassword,
                alignment: Alignment.bottomCenter,
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgArrowright,
              height: getVerticalSize(
                23,
              ),
              width: getHorizontalSize(
                22,
              ),
              alignment: Alignment.topRight,
              margin: getMargin(
                right: 7,
              ),
            ),
          ],
        ),
      );
}
