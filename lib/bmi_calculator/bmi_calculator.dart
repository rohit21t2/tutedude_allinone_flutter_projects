import 'package:flutter/material.dart';
import 'package:tutedude_allinone_flutter_projects/bmi_calculator/color.dart';
import 'package:tutedude_allinone_flutter_projects/bmi_calculator/second_page.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  String? selectedGender;
  double height = 120;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Gender Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderCard(
                  icon: Icons.male,
                  text: 'Male',
                  isSelected: selectedGender == 'Male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                ),
                GenderCard(
                  icon: Icons.female,
                  text: 'Female',
                  isSelected: selectedGender == 'Female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            /// Height Slider
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: blueColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$height cm',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    activeColor: selectedColor,
                    min: 120,
                    max: 200,
                    value: height,
                    onChanged: (v) {
                      setState(() {
                        height = v.round().toDouble();
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// Weight & Age
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Weight Card
                InfoCard(
                  label: "Weight",
                  value: weight,
                  onDecrement: () {
                    setState(() {
                      if (weight > 1) weight--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),

                /// Age Card
                InfoCard(
                  label: "Age",
                  value: age,
                  onDecrement: () {
                    setState(() {
                      if (age > 1) age--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            /// Calculate Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SecondPage(
                          age: age,
                          height: height,
                          weight: weight,
                        ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Gender Card Widget
class GenderCard extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 180,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : blueColor, // Color fix
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.white),
            SizedBox(height: 10), // Proper spacing
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Weight & Age Card Widget
class InfoCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const InfoCard({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: selectedColor,
                child: IconButton(
                  onPressed: onDecrement,
                  icon: Icon(Icons.remove, color: Colors.white),
                ),
              ),
              CircleAvatar(
                radius: 26,
                backgroundColor: selectedColor,
                child: IconButton(
                  onPressed: onIncrement,
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
