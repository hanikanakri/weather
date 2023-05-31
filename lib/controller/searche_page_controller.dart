import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/ditails/countries.dart';
import 'package:weather/function/check_internet_connection.dart';
import 'package:weather/network/http_handler.dart';

class SearchPageController extends GetxController {
  ApiHttpHandler apiHttpHandler = Get.put(ApiHttpHandler());

  var isLoadingData = true.obs;
  List<Countries> countries = [];
  List<Countries> filteredCountries = [];
  String cityName = '';



  @override
  void onInit(){
    getAllCountries();
    CheckInternet();
    super.onInit();
  }


  getAllCountries() async {
    countries = await apiHttpHandler.getCountryList();
    countries.sort((c1, c2) {
      return c1.name.compareTo(c2.name);
    });
    filteredCountries = countries;
    loadData1();
  }

  TextEditingController controller = TextEditingController();

  void loadData1() {
    isLoadingData.value = false;
    update();
  }


  void setState(value){
    update();
    if (value == "") {
      filteredCountries = countries;
    } else {
      filteredCountries = countries
          .where((element) => element.capital
          .toLowerCase()
          .startsWith(value.toLowerCase()))
          .toList();
    }
  }

}
