import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';

Widget appText = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Align(
      child: Text(
        "Sp".tr,
        overflow: TextOverflow.ellipsis,
        style: AppStyle.txtPoppinsSemiBold2446,
      ),
    ),
    CustomImageView(
      imagePath: ImageConstant.imgImage2,
      height: getVerticalSize(
        36,
      ),
      width: getHorizontalSize(
        30,
      ),
    ),
    Align(
      child: Text(
        "rtBuddies".tr,
        style: TextStyle(
          color: ColorConstant.teal300,
          fontSize: getFontSize(
            24.459915161132812,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ],
);

Widget interestContainer({required String name}) => Container(
      padding: getPadding(
        left: 5,
        right: 5,
      ),
      decoration: AppDecoration.fillTeal30066.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: getPadding(
            top: 5,
          ),
          child: Text(
            name.tr,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium12,
          ),
        ),
      ),
    );

// CustomImageView(
          //   imagePath: ImageConstant.imgImage4,
          //   height: getVerticalSize(
          //     107,
          //   ),
          //   width: getHorizontalSize(
          //     100,
          //   ),
          //   margin: getMargin(
          //     top: 5,
          //   ),
          // ),