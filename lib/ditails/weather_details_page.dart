import 'dart:convert';

class ApiWeatherInfoModel {
  String city;
  String status;
  double temp;
  String iconCode;

  String getImageUrl() {
    return "https://openweathermap.org/img/wn/$iconCode@2x.png";
  }

  ApiWeatherInfoModel({
    required this.city,
    required this.iconCode,
    required this.status,
    required this.temp,
  });

  String toJsonObject() {
    return jsonEncode({
      "city": this.city,
      "temp": this.temp,
    });
  }

  factory ApiWeatherInfoModel.fromJsonObject(dynamic data) {
    return ApiWeatherInfoModel(
        city: data["name"],
        status: data["weather"][0]["main"],
        temp: data["main"]["temp"],
        iconCode: data["weather"][0]["icon"]);
  }
}
