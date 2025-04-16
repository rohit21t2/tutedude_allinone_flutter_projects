import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutedude_allinone_flutter_projects/clima/screen/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key, this.weatherData});

  final weatherData;

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String emoji = '';
  String tempInCel = '';
  String currentWeather = '';
  String cityName = 'Unknown';

  String kelvinToCel(var temp) {
    double tempInCel = temp - 273.15;
    return tempInCel.floor().toString();
  }

  Future<Map<String, dynamic>?> getWeatherDataFromCityName(String cityName) async {
    var apiKey = '224f5a33ddc20c64f9a8d9da610222cf';
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': apiKey, // Fixed parameter key (should be 'appid', not 'apikey')
    });

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var weatherData = jsonDecode(response.body);
      return weatherData;
    } else {
      print('Error fetching weather data');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(Map<String, dynamic>? weatherData) {
    if (weatherData == null) return;

    setState(() {
      var weatherId = weatherData['weather'][0]['id'];

      if (weatherId > 200 && weatherId < 300) {
        emoji = '🌩️️';
      } else if (weatherId > 300 && weatherId < 400) {
        emoji = '⛈️';
      } else if (weatherId > 500 && weatherId < 600) {
        emoji = '🌧️';
      } else if (weatherId > 700 && weatherId < 800) {
        emoji = '☁️';
      } else if (weatherId >= 800) {
        emoji = '🌥️';
      }

      tempInCel = kelvinToCel(weatherData['main']['temp']);
      currentWeather = weatherData['weather'][0]['main'];
      cityName = weatherData['name']; // Fixed incorrect key
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/screen1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      updateUI(widget.weatherData);
                    },
                    icon: Icon(Icons.near_me, color: Colors.white, size: 35),
                  ),
                  IconButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Screen2()),
                      );

                      if (cityName != null && cityName.toString().isNotEmpty) {
                        var weatherData = await getWeatherDataFromCityName(cityName.toString());
                        if (weatherData != null) {
                          setState(() {
                            updateUI(weatherData);
                          });
                        }
                      }
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Text(
                cityName,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$tempInCel°',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(emoji, style: TextStyle(fontSize: 70)),
                  Text(
                    currentWeather,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
