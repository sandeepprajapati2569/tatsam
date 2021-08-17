import 'dart:core';
import 'package:dio/dio.dart';
import 'package:tatsam/api/ApiConstants.dart';
import 'package:tatsam/api/http_api_client.dart';
import 'package:tatsam/screens/home/Model/CountryModel.dart';

class CountryRepository {
  Future<List<CountryModel>> getCountryList() async {
    var response = await HttpApiClient.getInstance().get(ApiConstant.country);
    if (response != null &&
        response is Response &&
        response.statusCode == 200) {
      List<CountryModel> countryList = [];
      response.data["data"].forEach((key, value) {
        Map<String, dynamic> jsonData = Map.from(value);
        jsonData['key'] = key;
        countryList.add(CountryModel.fromJson(jsonData));
      });
      return countryList;
    } else {
      return [];
    }
  }
}
