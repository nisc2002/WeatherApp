import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Weather {
  String condition;
  double celsius;
  String cityName;

  IconData icon;

  Weather({String condition, double celsius, String cityName}) {
    this.condition = condition;
    this.celsius = celsius;
    this.cityName = cityName;
    this.icon = getIcon(condition);
  }

  IconData getIcon(String condition) {
    switch (condition) {
      case "Thunderstorm":
        return WeatherIcons.thunderstorm;
        break;
      case "Drizzle":
        return WeatherIcons.rain_mix;
        break;
      case "Rain":
        return WeatherIcons.rain_mix;
        break;
      case "Snow":
        return WeatherIcons.rain_mix;
        break;
      case "Mist":
      case "Smoke":
      case "Haze":
      case "Dust":
      case "Fog":
      case "Sand":
      case "Dust":
      case "Ash":
      case "Squall":
      case "Tornado":
        return WeatherIcons.fog; //same icon for all upper conditions
        break;
      case "Clear":
        return WeatherIcons.day_sunny;
        break;
      case "Clouds":
        return WeatherIcons.cloud;
        break;
    }
  }
}
