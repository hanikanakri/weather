import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:weather/ditails/countries.dart';
import 'package:weather/ditails/weather_details_page.dart';

class ApiHttpHandler {
  Future<ApiWeatherInfoModel> getWeatherForLocation(
      double lat, double lon) async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=d1038b2c4d58da539fc6db99071637e2&units=metric&lang=ar"));

    if (response.statusCode == 200) {
      debugPrint(response.body);

      dynamic data = jsonDecode(response.body);
      debugPrint('${data.runtimeType}');

      return ApiWeatherInfoModel.fromJsonObject(data);
    } else {
      debugPrint("Error ${response.statusCode}");
      debugPrint(response.body);
      return ApiWeatherInfoModel(city: "", status: "-", temp: 0, iconCode: "");
    }
  }



  Future<ApiWeatherInfoModel> getWeatherForCityName(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=d1038b2c4d58da539fc6db99071637e2&units=metric&lang=ar"));

    debugPrint('name 1');

    if (response.statusCode == 200) {
      debugPrint(response.body);
      dynamic data = jsonDecode(response.body);
      debugPrint('${data.runtimeType}');
      return ApiWeatherInfoModel.fromJsonObject(data);
    } else {
      debugPrint('Error ${response.statusCode}');
      debugPrint(response.body);
      debugPrint('ffffffffffffffffffffffffffffffffffffffffffffff');
      return ApiWeatherInfoModel(city: '', iconCode: '', status: '', temp: 0);
    }
  }

  Future<List<Countries>> getCountryList() async {
    http.Response response =
    await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    debugPrint('Step 1');
    if (response.statusCode == 200) {
      debugPrint(response.body);
      List<dynamic> data = jsonDecode(response.body);
      debugPrint('Type of data: ${data.runtimeType}');

      return Countries.fromJsonArray(data);
    } else {
      debugPrint("Error ${response.statusCode}");
      debugPrint(response.body);
      return [];
    }
  }





}



// {
//
//   List<ApiWeatherInfoModel> myList = [];
//   http.Response respond = await http.get(
//     Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=77d6a6e82c50d251fb8dd241d7f1c1cf&lang=en&units=metric'),
//   );
//   if (respond.statusCode == 200) {
//     dynamic data = jsonEncode(respond.body);
//     for (Map<String, dynamic> d in data) {
//       ApiWeatherInfoModel apiWeatherInfoModel =
//           ApiWeatherInfoModel.fromJSON(d);
//       myList.add(apiWeatherInfoModel);
//     }
//     debugPrint(data.toString());
//     return myList;
//   } else {
//     throw Exception('${respond.statusCode}');
//   }
// }
