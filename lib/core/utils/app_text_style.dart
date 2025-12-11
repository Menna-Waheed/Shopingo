import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle semibold24White = GoogleFonts.poppins(
      color: AppColor.whiteColor,
      fontSize: 24,
      fontWeight: FontWeight.w600
  );
  static TextStyle light16White = GoogleFonts.poppins(
      color: AppColor.whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w300
  );
  static TextStyle media18White = GoogleFonts.poppins(
      color: AppColor.whiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w500
  );
  static TextStyle regular18White = GoogleFonts.poppins(
      color: AppColor.whiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w400
  );
  static TextStyle semibold20custom = GoogleFonts.poppins(
      color: AppColor.customeBlue,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );
  static TextStyle light18hintColor = GoogleFonts.poppins(
      color: AppColor.whiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w300
  );


}