import 'package:flutter/material.dart';
import 'package:tutedude_allinone_flutter_projects/clima/screen/home_screen.dart';

class ClimaMain extends StatelessWidget {
  const ClimaMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima - Weather App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
