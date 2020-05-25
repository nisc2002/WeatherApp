part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();
}

class GetCities extends CityEvent {
  final String query;

  GetCities(this.query);
  @override

  List<Object> get props => [query];

}
