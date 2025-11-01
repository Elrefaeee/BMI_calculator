import 'package:flutter/material.dart';

class Slider_Height extends StatefulWidget {
  final double initialValue;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;
  final double height;
  final double width;

  Slider_Height({
    required this.initialValue,
    required this.onChanged,
    this.min = 1.0,
    this.max = 250.0,
    this.divisions = 250,
    this.height = 60.0,
    this.width = 300.0,
  });

  @override
  _Slider_HeightState createState() => _Slider_HeightState();
}

class _Slider_HeightState extends State<Slider_Height> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height, // Adjust to fit content tightly
      decoration: BoxDecoration(
        color: const Color(0xFF1c1c34), // Background color of the container
        borderRadius: BorderRadius.circular(10.0), // Add border radius
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'HEIGHT',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 122, 97, 165),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: _currentValue.toStringAsFixed(0), // Display the current value
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45.0, // Font size for the number
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'cm', // Display "cm"
                      style: TextStyle(
                        color: Color.fromARGB(255, 122, 97, 165),
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0, // Smaller font size for "cm"
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SliderTheme(
            data: const SliderThemeData(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.5), // Adjust thumb size here
              trackHeight: 2.0, // Adjust track thickness here
              activeTrackColor: const Color(0xFFeb1455),
              inactiveTrackColor: Colors.grey,
              overlayColor: Colors.transparent,
              thumbColor: const Color(0xFFeb1455),
              showValueIndicator: ShowValueIndicator.never, // Remove value indicator
            ),
            child: Slider(
              value: _currentValue,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              label: _currentValue.toStringAsFixed(0), // Display the value as a label
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
                widget.onChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
