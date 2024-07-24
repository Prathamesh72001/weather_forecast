import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/model/cities_model.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/utility/api_urls.dart';
import 'package:weather_forecast/utility/app_constants.dart';
import 'package:weather_forecast/utility/utils.dart';

class ApiService{
  static Future<List<String>?> getCityList() async {
    try {
      final response = await get(
        Uri.parse(ApiUrls.getCitiesAPI),
      );
      // Utils.prints("response", response.body);
      var model=CityList.fromJson(json.decode(response.body));
      return model.cities;
    } catch (e) {
      return null;
    }
  }

  static Future<WeatherData?> getCityWeather(String city) async {
    try {
      final response = await get(
        Uri.parse("${ApiUrls.getCityWeatherAPI}q=$city&APPID=${AppConstants.api_key}"),
      );
      Utils.prints("response", response.body);
      return WeatherData.fromJson(json.decode(response.body));
    } catch (e) {
      return null;
    }
  }
}