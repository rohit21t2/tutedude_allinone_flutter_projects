import 'dart:math';

import 'package:flutter/material.dart';

class DiceeApplication extends StatefulWidget {
  const DiceeApplication({super.key});

  @override
  State<DiceeApplication> createState() => _DiceeApplicationState();
}

class _DiceeApplicationState extends State<DiceeApplication> {
  var leftDice = 1;
  var rightDice = 6;
  void updateLeftDice() {
    final random = Random().nextInt(6) + 1;
    setState(() {
      leftDice = random;
    });
  }

  void updateRightDice() {
    final random = Random().nextInt(6) + 1;
    setState(() {
      rightDice = random;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        title: Text(
          'DICEE',
          style: TextStyle(
            fontFamily: 'Pangolin',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            updateLeftDice();
            updateRightDice();
          },
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/dice$leftDice.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/dice$rightDice.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
