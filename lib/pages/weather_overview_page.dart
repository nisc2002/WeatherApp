import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Wetter"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              recentCityButton("Winterthur"),
              recentCityButton("Zürich"),
              recentCityButton("Bern"),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
              child: Container(
                //color: Colors.red,
                //alignment: Alignment.center,
                child: weatherInfo("Winterthur"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherInfo(String cityName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              cityName,
              style: TextStyle(fontSize: 60),
            ),
          ),
        ),
        //Text(cityName),
        Expanded(
          flex: 3,
          child: FittedBox(
            child: BoxedIcon(WeatherIcons.cloud),
            fit: BoxFit.fitHeight,
          ),
        ),
        Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "23° C",
                style: TextStyle(fontSize: 50),
              ),
            )),
      ],
    );
  }

  Widget recentCityButton(String cityName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FlatButton(
          child: Text(
            cityName,
            overflow: TextOverflow.ellipsis,
          ),
          color: Colors.grey[200],
          onPressed: () {}, // TODO: implement call
        ),
      ),
    );
  }
}
