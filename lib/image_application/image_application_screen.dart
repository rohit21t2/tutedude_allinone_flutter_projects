import 'package:flutter/material.dart';

class ImageApplicationScreen extends StatelessWidget {
  const ImageApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        backgroundColor: Colors.cyan[800],
      ),
      backgroundColor: Colors.cyan[100],
      body: Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
        height: 500,
        width: 500,
      ),
    );
  }
}
