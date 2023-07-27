import 'package:flutter/material.dart';
import 'package:hava_durumu/utils/weather.dart';

class MainScreen extends StatefulWidget {
  final WeatherData weatherData;

  MainScreen({required this.weatherData});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int temprature;
  late Icon weaatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temprature = weatherData.currentTemperature.round();
      city = weatherData.city;
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weaatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 60,
            ),
            Container(
              child: weaatherDisplayIcon,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$temprature°',
                style: TextStyle(
                    color: Colors.white, fontSize: 80.0, letterSpacing: -5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              city,
              style: TextStyle(
                  color: Colors.white, fontSize: 50.0, letterSpacing: -5),
            ))
          ])),
    );
  }
}
