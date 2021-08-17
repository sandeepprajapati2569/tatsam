import 'dart:convert';

class CountryModel {
  String country;
  String region;
  String key;

  CountryModel({this.country, this.region, this.key});

  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    region = json['region'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["country"] = this.country;
    data["region"] = this.region;
    data["key"] = this.key;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return json.encode(toJson());
  }
}
