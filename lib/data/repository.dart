import 'model/city.dart';
import 'model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
}

class ExternWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) async {
    String apiKey = "72a1954d3fd18991c149e89bc1f78e9a";
    String url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

    var response = await http.post(url, headers: {
      "Accept": "application/json"
    });

    if (response.statusCode != 200) {
      throw NetworkError();
    }
    //print(response.statusCode);
    var data = json.decode(response.body);

    return Weather(
      cityName: cityName,
      celsius: data["main"]["temp"].toDouble(),
      condition: data["weather"][0]["main"],
    );
  }
}

abstract class CityRepository {
  Future<List<City>> fetchCities(String query);
}

class LocalCityRepository implements CityRepository {
  @override
  Future<List<City>> fetchCities(String query) async {
    String data = await rootBundle.loadString("assets/cities.json");
    var jsonData = json.decode(data);

    List<City> results = [];

    for(int i = 0; i < jsonData.length; i++) {
      if (jsonData[i]['city'].toLowerCase().startsWith(query.toLowerCase())) {
        results.add(City(jsonData[i]['city']));
      }
    }
    return results;
  }
}

class NetworkError extends Error {}
