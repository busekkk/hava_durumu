import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'location.dart';

const apikey = "07cab8450930532cd4c94c7e1a707e96";

class WeatherDisplayData {
  late Icon weatherIcon;
  late AssetImage weatherImage;

  WeatherDisplayData({required this.weatherImage, required this.weatherIcon});
}

class WeatherData {
  WeatherData({required this.locationData})
      : currentTemperature = 0.0, // Başlangıç değeri atandı
        currentCondition = 0;
  String city = '';

  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;

  Future<void> getCurrentTemperature() async {
    Response response = await get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apikey}&units=metric"
            as Uri);

    if (response.statusCode == 200) {
      String data = response.body;

      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print("API den değer gelmiyor");
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.cloud,
            size: 75.0,
            color: Colors.white,
          ),
          weatherImage: AssetImage('assets/bulutlu.png'));
    } else {
      var now = new DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(
            weatherIcon: Icon(
              FontAwesomeIcons.moon,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: AssetImage('assets/gece.png'));
      } else {
        return WeatherDisplayData(
            weatherIcon: Icon(
              FontAwesomeIcons.sun,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: AssetImage('assets/gunesli.png'));
      }
    }
  }
}
