part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();
}

class CityInitial extends CityState {
  final List<City> recent = [City("Winterthur"), City("Zürich"), City("Bern")];

  CityInitial();

  @override
  List<Object> get props => [];
}

class CityLoading extends CityState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class CityLoaded extends CityState {
  final List<City> cities;

  CityLoaded(this.cities);

  @override
  // TODO: implement props
  List<Object> get props => [cities];

}

class CityError extends CityState {
  final String message;

  CityError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];

}

