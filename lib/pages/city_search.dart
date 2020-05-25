import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/model/city.dart';
import 'package:weather_app/data/repository.dart';

class CitySearch extends SearchDelegate<WeatherEvent> {
  CitySearch(this.cityBloc);
  final Bloc<CityEvent, CityState> cityBloc;

  @override
  List<Widget> buildActions(BuildContext context) {}

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    cityBloc.add(GetCities(query));
  
    return BlocBuilder<CityBloc, CityState>(
      bloc: cityBloc,
      builder: (context, state) {
        if (state is CityInitial) {
          return buildInitial(state.recent);
        }
        if (state is CityLoading) {
          return buildLoading();
        }
        if (state is CityLoaded) {
          return buildLoaded(state.cities);
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    cityBloc.add(GetCities(query));

    return BlocBuilder<CityBloc, CityState>(
      bloc: cityBloc,
      builder: (context, state) {
        if (state is CityInitial) {
          return buildInitial(state.recent);
        }
        if (state is CityLoading) {
          return buildLoading();
        }
        if (state is CityLoaded) {
          return buildLoaded(state.cities);
        }
      },
    );
  }

  Widget buildInitial(List<City> recentCities) {
    return resultList(recentCities);
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildLoaded(List<City> results) {
    return resultList(results);
  }

  Widget resultList(List<City> cities) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(cities[index].cityName),
        onTap: () {
          close(context, GetWeather(cities[index].cityName));
        },
      ),
      itemCount: cities.length,
    );
  }
}
