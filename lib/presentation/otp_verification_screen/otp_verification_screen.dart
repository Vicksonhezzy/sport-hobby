import 'controller/otp_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/custom_button.dart';

class OtpVerificationScreen extends GetWidget<OtpVerificationController> {
  @override
  Widget build(BuildContext context) {
    controller.contexts = context;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray100,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  top: 40,
                ),
                child: Text(
                  "OTP Verificationn".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsSemiBold24,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 1,
                ),
                child: Text(
                  "A four digit code has been sent to".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular12,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 43,
                  top: 40,
                  right: 43,
                ),
                child: Obx(
                  () => PinCodeTextField(
                    appContext: context,
                    controller: controller.otpController.value,
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    enableActiveFill: true,
                    validator: (value) => value == null || value.length != 6
                        ? 'Field required'
                        : null,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {},
                    pinTheme: PinTheme(
                      fieldHeight: getHorizontalSize(
                        40,
                      ),
                      fieldWidth: getHorizontalSize(
                        40,
                      ),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          3,
                        ),
                      ),
                      selectedFillColor: ColorConstant.gray300,
                      activeFillColor: ColorConstant.gray300,
                      inactiveFillColor: ColorConstant.gray300,
                      inactiveColor: ColorConstant.fromHex("#1212121D"),
                      selectedColor: ColorConstant.fromHex("#1212121D"),
                      activeColor: ColorConstant.fromHex("#1212121D"),
                    ),
                  ),
                ),
              ),
              CustomButton(
                height: getVerticalSize(
                  47,
                ),
                text: "Continue".tr,
                onTap: () => controller.onConfirm(),
                margin: getMargin(
                  left: 38,
                  top: 43,
                  right: 43,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    top: 54,
                  ),
                  child: Text(
                    "Didn't get any code?".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBarlowRegular12,
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Padding(
              //     padding: getPadding(
              //       top: 10,
              //     ),
              //     child: Text(
              //       "Re-send Code".tr,
              //       overflow: TextOverflow.ellipsis,
              //       textAlign: TextAlign.left,
              //       style: AppStyle.txtBarlowSemiBold12,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
