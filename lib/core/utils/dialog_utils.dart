import 'package:e_commerce/core/utils/app_color.dart';
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
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColor.primaryColor),

              Text(message),
            ],
          ),
        );
      },
    );
  }
  // static void showMessage({required BuildContext context,required String message}){
  //  showDialog(
  //      context: context,
  //      builder: (context) {
  //        List<Widget>actions=[];
  //
  //        return AlertDialog(
  //
  //          content: ,
  //          actions: [],
  //          title: ,
  //        );
  //      },);
  //
  //
  // }
}
