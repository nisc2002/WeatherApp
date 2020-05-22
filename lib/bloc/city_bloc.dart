import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  @override
  CityState get initialState => CityInitial();

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
