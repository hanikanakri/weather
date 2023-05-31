


import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/ditails/weather_details_page.dart';
import 'package:weather/function/check_internet_connection.dart';
import 'package:weather/network/http_handler.dart';
import 'package:weather/permission/location_provider.dart';

class HomePageController extends GetxController {
  ApiHttpHandler apiHttpHandler = Get.put(ApiHttpHandler());
  LocationProvider locationProvider = Get.put(LocationProvider());

  var isLoadingData = true.obs;

  void getCurrentWeatherForMyLocation() async {
    Position position = await LocationProvider.checkPermissionAndGetLocation(locationProvider);
    apiWeatherInfoModel = await apiHttpHandler.getWeatherForLocation(
        position.latitude, position.longitude);
    loadData();
  }

  @override
  void onInit() {
    super.onInit();
    CheckInternet();
    getCurrentWeatherForMyLocation();

  }


  void loadData() {
    // set isLoadingData to true before loading data
    // load data...
    isLoadingData.value =
        false; // set isLoadingData to false when data is loaded
    update(); // notify the framework to update the UI
  } // false

  void loadData1() {
    // set isLoadingData to true before loading data
    // load data...
    isLoadingData.value =
        true; // set isLoadingData to false when data is loaded
    update(); // notify the framework to update the UI
  } //true

  ApiWeatherInfoModel apiWeatherInfoModel = ApiWeatherInfoModel(
    city: '',
    iconCode: '',
    status: '',
    temp: 0,
  );
}
