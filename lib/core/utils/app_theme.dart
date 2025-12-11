import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.whiteColor,
    primaryColor: AppColor.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}
