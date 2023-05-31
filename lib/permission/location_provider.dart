import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationProvider {
 static Future checkPermissionAndGetLocation(context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        Get.defaultDialog(
          title: 'Warning',
          middleText:
          'Location permission is required to continue using this app',
          textConfirm: 'Ask again',
          textCancel: 'Exit',
          onConfirm: () {
            checkPermissionAndGetLocation(context);
          },
          onCancel: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
        );
      } else if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return getWeather();
      }
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return getWeather();
    }
  }

static Future<Position> getWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    debugPrint(position.longitude.toString());
    debugPrint(position.latitude.toString());

    return position;
  }
}



