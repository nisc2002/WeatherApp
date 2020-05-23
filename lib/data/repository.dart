import 'model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    
    print(response.statusCode);
    var data = json.decode(response.body);

    return Weather(
      cityName: cityName,
      celsius: data["main"]["temp"],
      condition: data["weather"][0]["main"],
    );
  }
}

abstract class CityRepository {
  Future<List<String>> fetchCities();
}

class ExternCityRepository implements CityRepository {
  @override
  Future<List<String>> fetchCities() {
    // TODO: implement fetchCities
    throw UnimplementedError();
  }
}

class NetworkError extends Error {}
