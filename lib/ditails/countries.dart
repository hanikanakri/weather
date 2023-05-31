class Countries {
  String name;
  String capital;
  String flag;

  Countries({required this.name, required this.capital, required this.flag});

static List<Countries> fromJsonArray(List<dynamic> jsonArray){
  return List<Countries>.from(jsonArray.map((e) => Countries.FromJsonObject(e)));
}

  factory Countries.FromJsonObject(dynamic data) {
    return Countries(
        name: data['name']['common'],
        capital: data["capital"] == null ? "-" : data["capital"][0],
        flag: data["flags"]["png"]);
  }
}
