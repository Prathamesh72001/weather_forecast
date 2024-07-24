import 'package:flutter/foundation.dart';
import 'package:weather_forecast/utility/icons.dart';

class Utils {
  static String getIcon(String weather) {
    switch (weather) {
      case "few clouds":
        return BrandIcons.partly_clouds;
      case "haze":
        return BrandIcons.haze;
      case "clear sky":
        return BrandIcons.sunny;
      case "moderate rain":
        return BrandIcons.rain;
      default:
        return BrandIcons.clouds;
    }
  }

  static void prints(String tag, String console) {
    if (kDebugMode) {
      print("$tag : $console");
    }
  }

  static String convertValue(double value) {
    return (value / 10).toStringAsFixed(2);
  }
}
