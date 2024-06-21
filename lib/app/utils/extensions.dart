import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SnackBarCustom on GetInterface {
  void errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      maxWidth: 250,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(.5),
      snackPosition: SnackPosition.BOTTOM,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
  }

  void notifSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      maxWidth: 250,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(.5),
      snackPosition: SnackPosition.TOP,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
  }
}

extension CustomDialog on GetInterface {

  void showOkDialog(Function onPressed,
      {String title = "", String content = ""}) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {onPressed();},
    );
    Get.defaultDialog(
        title: title,
        content: Text(content),
        actions: [
          okButton
        ],
      radius: 10.0
    );
  }
}
