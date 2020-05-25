import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'city_search.dart';

class WeatherOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Wetter"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async{
                WeatherEvent event = await showSearch(context: context, delegate: CitySearch(BlocProvider.of<CityBloc>(context)));
                //print(event);
                event != null ? BlocProvider.of<WeatherBloc>(context).add(event) : null;
              })
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              recentCityButton(context, "Winterthur"),
              recentCityButton(context, "Zürich"),
              recentCityButton(context, "Bern"),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
              child: BlocBuilder<WeatherBloc, WeatherState>(
                //color: Colors.red,
                //alignment: Alignment.center,
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return buildInitial();
                  } else if (state is WeatherLoading) {
                    return buildLoading();
                  } else if (state is WeatherLoaded) {
                    return buildWeatherInfo(state.weather);
                  }
                  return buildInitial();
                },
                //child: weatherInfo("Winterthur"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWeatherInfo(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              weather.cityName,
              style: TextStyle(fontSize: 60),
            ),
          ),
        ),
        Text(
          weather.condition,
          style: TextStyle(fontSize: 40),
        ),
        /*Expanded(
          flex: 0.5,
          child: Center(
            child: Text(weather.condition),
          )
          ),*/
        //Text(cityName),
        Expanded(
          flex: 3,
          child: FittedBox(
            child: BoxedIcon(weather.icon),
            fit: BoxFit.fitHeight,
          ),
        ),
        Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "${weather.celsius} °C",
                style: TextStyle(fontSize: 50),
              ),
            )),
      ],
    );
  }

  Widget recentCityButton(BuildContext context, String cityName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FlatButton(
          child: Text(
            cityName,
            overflow: TextOverflow.ellipsis,
          ),
          color: Colors.grey[200],
          onPressed: () {
            final weatherBloc = BlocProvider.of<WeatherBloc>(context);
            weatherBloc.add(GetWeather(cityName));
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return CircularProgressIndicator();
  }

  Widget buildInitial() {
    return Container(
      color: Colors.blue,
    );
  }
}