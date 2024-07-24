import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/service/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<WeatherData> _cityWeatherApiResponse = [];

  List<WeatherData> get response {
    return _cityWeatherApiResponse;
  }

  Future<void> getCityWeatherApi() async {
    List<String>? cityModel = await ApiService.getCityList();
    if (cityModel != null) {
      var cityResponse = cityModel;
      List<WeatherData> weatherList = [];
      for (var element in cityResponse) {
        var weatherModel = await ApiService.getCityWeather(element);
        if (weatherModel != null) {
          weatherList.add(weatherModel);
        }
      }
      _cityWeatherApiResponse = weatherList;
      notifyListeners();
    }
  }
}
