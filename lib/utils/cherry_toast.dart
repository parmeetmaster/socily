import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lib/cherry_toast.dart';
import 'lib/resources/arrays.dart';

class Toast {
  static showError(
      {String title = "",
      String message = "",
      IconData iconData = Icons.clear}) {
    CherryToast(
            icon: iconData,
            themeColor: Colors.red,
            title: title,
            displayTitle: true,
            description: message,
            toastPosition: POSITION.BOTTOM,
            animationType: ANIMATION_TYPE.FROM_BOTTOM,
            toastDuration: Duration(milliseconds: 2000),
            animationDuration: Duration(milliseconds: 100),
            autoDismiss: true)
        .show(Get.context!);
  }

  static showSuccess(
      {String title = "",
      String message = "",
      IconData iconData = Icons.check_rounded}) {
    CherryToast(
            icon: iconData,
            themeColor: Colors.green,
            title: title,
            displayTitle: title.isNotEmpty,
            description: message,
            toastPosition: POSITION.BOTTOM,
            animationType: ANIMATION_TYPE.FROM_BOTTOM,
            toastDuration: Duration(milliseconds: 2000),
            animationDuration: Duration(milliseconds: 100),
            autoDismiss: true)
        .show(Get.context!);
  }
}
