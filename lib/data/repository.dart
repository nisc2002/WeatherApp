import 'model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
}

class ExternWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    // TODO: implement fetchWeather
    throw UnimplementedError();
  }

}


abstract class CityRepository {
  Future<List<String>> fetchCities();
}

class ExternCityRepository implements CityRepository{
  @override
  Future<List<String>> fetchCities() {
    // TODO: implement fetchCities
    throw UnimplementedError();
  }

}

class NetworkError extends Error {}