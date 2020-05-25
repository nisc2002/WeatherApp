import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/city.dart';
import 'package:weather_app/data/repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository cityRepository;

  CityBloc(this.cityRepository);
  
  @override
  CityState get initialState => CityInitial();

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    // TODO: implement mapEventToState
    yield CityLoading();
    if (event is GetCities) {
      try {
        final cities = await cityRepository.fetchCities(event.query);
        yield CityLoaded(cities);
      }
      on NetworkError {
        yield CityError("Couln't retrieve cities");
      }
    }
  }
}
