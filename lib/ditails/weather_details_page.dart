class ApiWeatherInfoModel {
  String city;
  String status;
  double temp;
  String iconCode;

  String getImageUrl() {
    return "https://openweathermap.org/img/wn/$iconCode@2x.png";
  }

  ApiWeatherInfoModel(
      {required this.city,
      required this.iconCode,
      required this.status,
      required this.temp});

  // factory ApiWeatherInfoModel.fromJSON(Map<String, dynamic> data) {
  //   return ApiWeatherInfoModel(
  //     city: data['name'],
  //     temp: data["main"]["temp"],
  //     iconCode: data['weather'][0]['icon'],
  //     status: data['main'][0]['main'],
  //   );
  // }
}
