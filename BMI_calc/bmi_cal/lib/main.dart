import 'package:bmi_cal/BmiResultScreen.dart';
import 'package:bmi_cal/factors.dart';
import 'package:flutter/material.dart';
import 'Gender.dart';
import 'Slider_Height.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSliderValue = 178; // Default value as int
  int _weight = 90;
  int _age = 26;

  @override
  void initState() {
    super.initState();
    // Automatically select Male when the app starts
    Future.delayed(Duration.zero, () {
      _selectGender(0); // Simulate Male button press
    });
  }

  void _selectGender(int index) {
    if (index == 0) {
      print('Male button pressed');
    } else {
      print('Female button pressed');
    }
    // You can also add any other logic here for gender selection
  }

  // Function to handle updates from the Factors widget
  void _updateValues(int index, int newValue) {
    setState(() {
      if (index == 0) {
        _weight = newValue;
      } else if (index == 1) {
        _age = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000022),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF000022),
      body: Column(
        children: [
          Gender(
            imagePaths: ['assets/male.png', 'assets/female.png'],
            labels: ['MALE', 'FEMALE'],
            onPressedCallbacks: [
              () {
                _selectGender(0); // Handle MALE button press
              },
              () {
                _selectGender(1); // Handle FEMALE button press
              },
            ],
          ),
          const SizedBox(height: 5), // Add some space between widgets
          Slider_Height(
            initialValue: _currentSliderValue.toDouble(), // Pass value as double
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value.toInt(); // Convert double to int
              });
              print('Slider value: $_currentSliderValue');
            },
            height: 150,
            width: 357,
          ),
          const SizedBox(height: 5),
          Factors(
            titles: const ['WEIGHT', 'AGE'],
            initialValues: [_weight, _age],
            onValueChanged: _updateValues, // Pass the callback function
          ),
          const SizedBox(height: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                // Show AlertDialog with BMI calculation
                double heightInMeters = _currentSliderValue / 100.0; // Convert height to meters
                double bmi = _weight / (heightInMeters * heightInMeters); // BMI calculation
                
Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BmiResultScreen(bmi: bmi),
              ),
            );
                print("Button tapped"); // Print statement after showing the dialog
              },
              child: Container(
                color: const Color(0xFFeb1455), // Background color
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20.0),
                child: const Text(
                  "CALCULATE",
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
    );
  }
}
