import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillTeal30066 => BoxDecoration(
        color: ColorConstant.teal30066,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get outlineTeal300 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.teal300,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder23 = BorderRadius.circular(
    getHorizontalSize(
      23,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

// double get strokeAlignInside => BorderSide.strokeAlignInside;

// double get strokeAlignCenter => BorderSide.strokeAlignCenter;

// double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
