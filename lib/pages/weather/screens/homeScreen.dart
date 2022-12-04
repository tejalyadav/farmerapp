import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:farmerapp/pages/weather/model/forecastModel.dart';
import 'package:farmerapp/pages/weather/model/weatherModel.dart';
import 'package:farmerapp/pages/weather/widgets/weather.dart';
import 'package:farmerapp/pages/weather/widgets/weatherItem.dart';
import 'package:http/http.dart' as http;
import 'package:farmerapp/classes/language_constants.dart';

class WHomescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();

}

class _HomescreenState extends State<WHomescreen> {


  bool isLoading = false;
  var weatherData;
  var forecastData;

  loadWeather() async {
    setState(() {
      isLoading = true;
    });
    //Position position;
    Position position;
    position= await _determinePosition();



    //try {
      //position =
      //await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    //} catch (e) {
      //print(e);
    //}

    if (position != null) {
      final lat = position.latitude;
      final lon = position.longitude;

      //final weatherResponse = await http.get(
          //'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=ebb11d5b092574f40e3499f6b4ea60bc');
      //final forecastResponse = await http.get(
          //"https://api.openweathermap.org/data/2.5/forecast?APPID=ebb11d5b092574f40e3499f6b4ea60bc&lat=${lat.toString()}&lon=${lon.toString()}");

      var url1 = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
        'lat': '19.0760',
        'lon': '72.8777',
        'appid': 'ebb11d5b092574f40e3499f6b4ea60bc'
      });

      http.Response weatherResponse = await http.get(url1);

      var url2 = Uri.https('api.openweathermap.org', 'data/2.5/forecast', {
        'lat': '${lat}',
        'lon': '${lon}',
        'appid': 'ebb11d5b092574f40e3499f6b4ea60bc'
      });

      http.Response forecastResponse = await http.get(url2);



      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
           WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
           ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).currentweatherlocation),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: weatherData != null
                        ? Weather(weather: weatherData)
                        : Container(),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: isLoading
                  //       ? CircularProgressIndicator(
                  //           strokeWidth: 2.0,
                  //           valueColor:
                  //               new AlwaysStoppedAnimation(Colors.white),
                  //         )
                  //       : IconButton(
                  //           icon: new Icon(Icons.refresh),
                  //           tooltip: 'Refresh',
                  //           onPressed: loadWeather,
                  //           color: Colors.white,
                  //         ),
                  // ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  child: forecastData != null
                      ? ListView.builder(
                      itemCount: forecastData.list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => WeatherItem(
                          weather: forecastData.list.elementAt(index)))
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

