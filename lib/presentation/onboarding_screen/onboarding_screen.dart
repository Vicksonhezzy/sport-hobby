import 'package:sportbuddy/widgets/random_widgets..dart';

import 'controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ]))));
  }
}
