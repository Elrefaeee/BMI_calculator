import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double bmi;

  BmiResultScreen({required this.bmi});

  @override
  Widget build(BuildContext context) {
    String bmiCategory;
    Color bmiColor;

    if (bmi < 18.5) {
      bmiCategory = 'UNDERWEIGHT';
      bmiColor = Colors.yellow;
    } else if (bmi < 25.0) {
      bmiCategory = 'NORMAL';
      bmiColor = Colors.orange;
    } else if (bmi < 30.0) {
      bmiCategory = 'OVERWEIGHT';
      bmiColor = Colors.green;
    } else {
      bmiCategory = 'OBESE';
      bmiColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF000022),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFF000022), 
        width: double.infinity,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'YOUR RESULT',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 20, 37), // Background color of the container
                borderRadius: BorderRadius.circular(15), // Circular radius for rounded corners
              ),
              width: 370,
              height: 420,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            Text(
              bmiCategory,
              style: TextStyle(
                  fontSize: 32,
                  color: bmiColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(
                  fontSize: 65,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'INTERPERTATION',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),],),),
            const SizedBox(height: 50,),
            Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: const Color(0xFFeb1455), // Background color
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20.0),
                child: const Text(
                  "RECALCULATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
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
