
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/ditails/weather_details_page.dart';
import 'package:weather/function/check_internet_connection.dart';
import 'package:weather/network/http_handler.dart';

class HomePageController extends GetxController {

  ApiHttpHandler apiHttpHandler = Get.put(ApiHttpHandler());

  var isLoadingData = true.obs;


  @override
  void onInit() {
    super.onInit();
    checkPermissionAndGetLocation();
    CheckInternet();
  }

  void checkPermissionAndGetLocation() async {
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
            checkPermissionAndGetLocation();
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
      // } else if (permission == LocationPermission.whileInUse ||
      //     permission == LocationPermission.always) {
      //   getWeather();
    }
    getWeather();
    // LocationPermission permission = await Geolocator.checkPermission();
    //
    // if (permission == LocationPermission.denied) {
    //   LocationPermission permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     // ignore: use_build_context_synchronously
    //     Get.defaultDialog(
    //       title: 'Warning',
    //       middleText:
    //           'Location permission is required to continue using this app',
    //       textConfirm: 'Ask again',
    //       textCancel: 'Exit',
    //       onConfirm: () {
    //         checkPermissionAndGetLocation();
    //       },
    //       onCancel: () {
    //         if (Platform.isAndroid) {
    //           SystemNavigator.pop();
    //         } else if (Platform.isIOS) {
    //           exit(0);
    //         }
    //       },
    //     );
    //   } else if (permission == LocationPermission.whileInUse ||
    //       permission == LocationPermission.always) {
    //     return getWeather();
    //   }
    // }
  }


  ApiWeatherInfoModel apiWeatherInfoModel = ApiWeatherInfoModel(city: '', iconCode: '', status: '', temp: 0,);


//   void getWeather() async{
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy:LocationAccuracy.high
//     );
//
//     debugPrint(position.longitude.toString());
//     debugPrint(position.latitude.toString());
//
//     apiWeatherInfoModel = await apiHttpHandler.getWeatherForLocation(
//         position.longitude ,position.latitude
//     );
//
// update(isLoadingData = false);
//   }

  void getWeather() async {


      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      //position.then((value) => null);
      apiWeatherInfoModel = await apiHttpHandler.getWeatherForLocation(
          position.latitude, position.longitude);

      isLoadingData.value = false;
      loadData();






  }
  void loadData()  {
    // set isLoadingData to true before loading data
    // load data...
    isLoadingData.value = false; // set isLoadingData to false when data is loaded
    update(); // notify the framework to update the UI
  }
  
  
  
}


