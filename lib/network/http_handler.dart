import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:weather/ditails/countries.dart';
import 'package:weather/ditails/weather_details_page.dart';

class ApiHttpHandler {
  Future<ApiWeatherInfoModel> getWeatherForLocation(
      double lat, double lon,) async{

      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=d1038b2c4d58da539fc6db99071637e2&units=metric&lang=ar"));

      if (response.statusCode == 200) {
        // print(response.body);

        dynamic data = jsonDecode(response.body);
        // print("data"+data);
        // print(data.runtimeType);
        ApiWeatherInfoModel infoModel = ApiWeatherInfoModel(
            city: data["name"],
            status: data["weather"][0]["main"],
            temp: data["main"]["temp"],
            iconCode: data["weather"][0]["icon"]);
        /*print(data["name"]);
      print(data["main"]["temp"]);
      print(data["weather"][0]["main"]);*/
        return infoModel;
      } else {
        debugPrint("Error ${response.statusCode}");
        debugPrint(response.body);
        return ApiWeatherInfoModel(city: "", status: "-", temp: 0, iconCode: "");
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

  Future<List<Countries>> getCountryList() async {

    http.Response response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      List<dynamic> data = jsonDecode(response.body);
      List<Countries> countries = data
          .map(
            (e) => Countries(
              name: e["name"]["common"],
              capital: e["capital"] == null ? "-" : e["capital"][0],
              flag: e["flags"]["png"],
            ),
          )
          .toList();
      debugPrint('Type of data: ${data.runtimeType}');
      return countries;
    } else {
      debugPrint("Error ${response.statusCode}");
      debugPrint(response.body);
      return [];
    }
  }

