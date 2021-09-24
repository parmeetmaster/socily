import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loaders {
  static late Timer _timer;
  static int dismissDuration = 30;
  static self_terminate({Duration? duration}) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (dismissDuration == 0) {
          timer.cancel();
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
            EasyLoading.showError("Something is Error");
          }
        } else {
          print(dismissDuration);
          dismissDuration--;
        }
      },
    );
  }

  static showuploading() {
    EasyLoading.show(status: 'Uploading...');
    self_terminate();
  }

  static showCustom(String string) {
    EasyLoading.show(status: string);
    self_terminate();
  }

  static showSuccess() {
    EasyLoading.showSuccess("Upload Successfully");
    _timer.cancel();
  }

  static showCustomSuccess(String string) {
    EasyLoading.showSuccess(string);
    _timer.cancel();
  }

  static dismiss() {
    _timer.cancel();
    EasyLoading.dismiss();
  }
}
