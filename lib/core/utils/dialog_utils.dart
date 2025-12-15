import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(

          content: Row(
            children: [
              CircularProgressIndicator(color: AppColor.primaryColor),

              Text(message, style: AppTextStyle.regular16custom,),
            ],
          ),
        );
      },
    );
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String?title,
    String ? posName,
    String ? negName,
    Function? posAction,
    Function? negAction,

  }) {
    List<Widget>actions = [];
    if (posName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posName, style: AppTextStyle.regular16custom)));
    }

    if (negName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negName, style: AppTextStyle.regular16custom)));
    }


    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message, style: AppTextStyle.semibold20custom,),
          actions: actions,
          title: Text(title ?? '',),
        );
      },);
  }
}
