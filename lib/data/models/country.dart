class Country {
  String code;
  String name;
  List<dynamic> language;
  String emoji;

  Country.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        name = json["name"],
        emoji = json["emoji"],
        language = json["languages"];
}