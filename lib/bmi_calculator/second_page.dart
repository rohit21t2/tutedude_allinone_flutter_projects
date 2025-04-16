import 'package:flutter/material.dart';
import 'package:tutedude_allinone_flutter_projects/bmi_calculator/color.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
  });

  final double height;
  final int weight;
  final int age;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late final double bmi;
  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var bmiImage = 'normal';

  void calculateBMI() {
    final heightInMatter = widget.height / 100;
    bmi = widget.weight / (heightInMatter * heightInMatter);
  }
  void updateUI(){
    if(bmi<18){
      setState(() {
        bmiColor = Colors.lightBlueAccent;
        bmiText = 'Underweight';
        bmiImage = 'underweight';
      });
    }else if(bmi>=18 && bmi <= 25){
      setState(() {
        bmiColor = Colors.green;
        bmiText = 'Normal';
        bmiImage = 'normal';
      });
    }else if(bmi>25 && bmi <= 30){
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'Overweight';
        bmiImage = 'overweight';
      });
    }else if(bmi>30 && bmi <= 35){
      setState(() {
        bmiColor = Colors.yellow;
        bmiText = 'Obese';
        bmiImage = 'obese';
      });
    }else{
      setState(() {
        bmiColor = Colors.red;
        bmiText = 'Extreme';
        bmiImage = 'extreme';
      });
    }
  }
  @override
  void initState() {
    calculateBMI();
    updateUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            color: blueColor,
            height: 160,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your BMI value is',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bmi.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bmiText,
                  style: TextStyle(fontSize: 40, color: bmiColor),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/$bmiImage.png'),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                  'Re-Calculate',
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
    );
  }
}
