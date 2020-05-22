part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String cityName;

  GetWeather(this.cityName);
  
  @override
  // TODO: implement props
  List<Object> get props => [cityName];

}

class GetCities extends WeatherEvent {
  //final List<String> cities;
  //GetCities(this.cities);
  
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
