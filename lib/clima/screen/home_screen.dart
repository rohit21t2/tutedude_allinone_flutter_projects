import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:tutedude_allinone_flutter_projects/clima/screen/screen1.dart';
import 'package:tutedude_allinone_flutter_projects/clima/service/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getLocationAndWeather();
    });
  }

  Future<void> getLocationAndWeather() async {
    try {
      final location = Location();
      await location.getCurrentLocation();

      final apiKey = 'a61b4d4398f6f7f77b6a5ba06f970f81';
      final url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'appid': apiKey,
        'units': 'metric', // optional: makes temperature in Celsius
      });

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Screen1(weatherData: data)),
        );
      } else {
        _showError('Failed to load weather data.');
      }
    } catch (e) {
      _showError('Error: ${e.toString()}');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }
}
