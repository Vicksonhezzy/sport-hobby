import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:sportbuddy/core/app_export.dart';
import 'package:sportbuddy/widgets/random_widgets..dart';

import '../log_in_screen/models/log_in_model.dart';
import 'controller/profile_controller.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
              return Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 41,
                            top: 32,
                          ),
                          child: Text(
                            "My Profile".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold18,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: getVerticalSize(
                              100,
                            ),
                            width: getHorizontalSize(
                              100,
                            ),
                            margin: getMargin(
                              top: 30,
                            ),
                            padding: getPadding(
                              left: 15,
                              top: 6,
                              right: 15,
                              bottom: 6,
                            ),
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.green),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: fs.Svg(
                                  ImageConstant.imgGroup74,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage3,
                                  height: getVerticalSize(
                                    75,
                                  ),
                                  width: getHorizontalSize(
                                    62,
                                  ),
                                  alignment: Alignment.bottomCenter,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              top: 13,
                            ),
                            child: Text(
                              user.username!.tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsSemiBold18Teal300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 41,
                            top: 22,
                          ),
                          child: Text(
                            "Personal Details".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold18,
                          ),
                        ),
                        userDetails(
                            title: 'Phone Number', subtitle: user.number!),
                        userDetails(
                            title: 'Email Address', subtitle: user.email!),
                        Padding(
                          padding: getPadding(
                            left: 41,
                            top: 39,
                          ),
                          child: Text(
                            "Interest".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold18,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 41,
                              top: 12,
                              right: 37,
                              bottom: 5,
                            ),
                            child: GridView.builder(
                              itemCount: user.interest!.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 3),
                              itemBuilder: (context, index) {
                                return interestContainer(
                                    name: user.interest![index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget userDetails({required String title, required String subtitle}) =>
      Padding(
        padding: getPadding(
          left: 41,
          top: 7,
        ),
        child: Row(
          children: [
            Text(
              "$title:".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium12,
            ),
            Padding(
              padding: getPadding(
                left: 13,
                top: 2,
              ),
              child: Text(
                subtitle.tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular10Black900,
              ),
            ),
          ],
        ),
      );
}
