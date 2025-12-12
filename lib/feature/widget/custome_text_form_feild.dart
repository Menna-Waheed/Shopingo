import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnValidator = String? Function(String?)?;

class CustomeTextFormFeild extends StatelessWidget {
  CustomeTextFormFeild({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.validator,
    this.controller,
    this.keyboardType,
  });

  String hintText;
  TextStyle? hintStyle;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;

  OnValidator validator;
  TextEditingController? controller;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: TextFormField(
        style: AppTextStyle.media18White,
        decoration: InputDecoration(
          errorBorder: buildCustomeBoarder(boarderColor: AppColor.redColor),
          enabledBorder: buildCustomeBoarder(boarderColor: AppColor.whiteColor),
          focusedErrorBorder: buildCustomeBoarder(
            boarderColor: AppColor.redColor,
          ),
          focusedBorder: buildCustomeBoarder(boarderColor: AppColor.whiteColor),
          hintText: hintText,
          hintStyle: hintStyle ?? AppTextStyle.light18hintColor,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        obscureText: obscureText ?? false,
        validator: validator,
        controller: controller,
        cursorColor: AppColor.whiteColor,
        keyboardType: keyboardType,
      ),
    );
  }

  OutlineInputBorder buildCustomeBoarder({required Color boarderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: boarderColor, width: 2),
    );
  }
}
