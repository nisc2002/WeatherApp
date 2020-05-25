import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository.dart';
import 'package:weather_app/pages/weather_overview_page.dart';

import 'bloc/city_bloc.dart';
import 'bloc/weather_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => WeatherBloc(ExternWeatherRepository()),
        ),
        BlocProvider(create: (context) => CityBloc(LocalCityRepository()))
      ], child: WeatherOverviewPage()),
    );
  }
}
