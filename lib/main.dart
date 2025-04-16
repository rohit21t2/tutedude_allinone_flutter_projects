import 'package:flutter/material.dart';
import 'bmi_calculator/bmi_calculator.dart';
import 'clima/clima_main.dart';
import 'dicee_application/dicee_application.dart';
import 'image_application/image_application_screen.dart';
import 'personal_business_card_application/personal_business_card_application.dart';
import 'xylophone_application/xylophone_application.dart';
import 'pokepedia/pokepedia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All-in-One Flutter Projects',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF131145),
      ),
      home: const ProjectListScreen(),
    );
  }
}

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Projects'),
        backgroundColor: const Color(0xFF131145),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProjectTile(
            title: "Image Application",
            subtitle: "Display and interact with images",
            icon: Icons.image,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImageApplicationScreen()),
              );
            },
          ),
          ProjectTile(
            title: "Business Card",
            subtitle: "Your digital personal profile card",
            icon: Icons.badge,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonalBusinessCardApplication()),
              );
            },
          ),
          ProjectTile(
            title: "Dicee Application",
            subtitle: "Roll a pair of dice for fun!",
            icon: Icons.casino,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DiceeApplication()),
              );
            },
          ),
          ProjectTile(
            title: "Xylophone",
            subtitle: "Play a fun virtual xylophone!",
            icon: Icons.music_note,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const XylophoneApplication()),
              );
            },
          ),
          ProjectTile(
            title: "BMI Calculator",
            subtitle: "Calculate your Body Mass Index",
            icon: Icons.monitor_weight,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiCalculator()),
              );
            },
          ),
          ProjectTile(
            title: "Clima",
            subtitle: "Get live weather updates using OpenWeatherMap",
            icon: Icons.cloud,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClimaMain()),
              );
            },
          ),
          ProjectTile(
            title: "Pokepedia",
            subtitle: "Get information about Pokémon",
            icon: Icons.search,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pokepedia()), // Navigating to Pokepedia
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const ProjectTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff033e66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, color: Colors.white, size: 32),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: onTap,
      ),
    );
  }
}
