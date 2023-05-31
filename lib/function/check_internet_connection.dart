import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

CheckInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return null;
    }
  } on SocketException catch (_) {
    return Get.defaultDialog(
      title: 'Warning',
      middleText: 'there is no internet connection',
      textCancel: 'Exit',
      textConfirm: 'Try Again',
      onConfirm: () {
        Restart.restartApp();
      },
      onCancel: () {
        SystemNavigator.pop();
      },
    );
  }
}
