import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomElevetedButton extends StatelessWidget {
  CustomElevetedButton({
    super.key,
    required this.onPressed,
    this.isIcon = false,
    this.radiousBoarder = 15,
    this.backgroundColor,
    this.iconName,
    required this.text,
    this.style,
    this.mainAxisAlignment,
  });

  void Function()? onPressed;
  bool isIcon;
  double radiousBoarder;
  Color? backgroundColor = AppColor.blueColor;
  final Widget? iconName;
  String text;
  TextStyle? style = AppTextStyle.semibold20custom;
  MainAxisAlignment? mainAxisAlignment = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radiousBoarder),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
      ),
      onPressed: onPressed,
      child: isIcon
          ? Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: [
                iconName ?? SizedBox(),
                Text(text, style: style),
              ],
            )
          : Text(text, style: style),
    );
  }
}
