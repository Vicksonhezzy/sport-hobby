import 'package:flutter/material.dart';
import 'package:sportbuddy/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.enabled = true,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  bool enabled;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(isHint: true),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      filled: _setFilled(),
      isDense: true,
    );
  }

  _setFontStyle({bool isHint = false}) {
    switch (fontStyle) {
      case TextFormFieldFontStyle.PoppinsRegular12:
        return TextStyle(
          color: isHint ? Colors.grey : ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.50,
          ),
        );
      default:
        return TextStyle(
          color: isHint ? Colors.grey : ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.50,
          ),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            23.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineBlack9004c:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.black9004c,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.teal300,
            width: 1,
          ),
        );
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineTeal300:
        return false;
      case TextFormFieldVariant.UnderLineBlack9004c:
        return false;
      case TextFormFieldVariant.None:
        return false;
      default:
        return false;
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder23,
}

enum TextFormFieldVariant {
  None,
  OutlineTeal300,
  UnderLineBlack9004c,
}

enum TextFormFieldFontStyle {
  PoppinsMedium10,
  PoppinsRegular12,
}

class DropDown extends StatelessWidget {
  String? value;
  Function(String?)? onChanged;
  List<String> items;
  DropDown({Key? key, this.onChanged, this.value, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: Colors.transparent,
      margin: getMargin(
        top: 10,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorConstant.teal300,
          width: getHorizontalSize(
            1,
          ),
        ),
        borderRadius: BorderRadiusStyle.roundedBorder23,
      ),
      child: Container(
        height: getVerticalSize(
          57,
        ),
        width: getHorizontalSize(
          309,
        ),
        padding: getPadding(
          left: 15,
          top: 12,
          right: 33,
          bottom: 12,
        ),
        decoration: AppDecoration.outlineTeal300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder23,
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            'Select Interest',
            style: TextStyle(
              color: Colors.grey,
              fontSize: getFontSize(
                17,
              ),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: getVerticalSize(
                1.50,
              ),
            ),
          ),
          underline: Container(),
          icon: CustomImageView(
            svgPath: ImageConstant.imgArrowdown,
            height: getVerticalSize(
              22,
            ),
            width: getHorizontalSize(
              23,
            ),
            alignment: Alignment.centerRight,
          ),
          value: value,
          items: items.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      17,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: getVerticalSize(
                      1.50,
                    ),
                  ),
                ));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
