import 'package:flutter/material.dart';

class Factors extends StatefulWidget {
  final List<String> titles;
  final List<int> initialValues;
  final Function(int index, int newValue) onValueChanged; // Callback function

  const Factors({
    Key? key,
    required this.titles,
    required this.initialValues,
    required this.onValueChanged, // Accept the callback function
  }) : super(key: key);

  @override
  _FactorsState createState() => _FactorsState();
}

class _FactorsState extends State<Factors> {
  late List<int> _currentValues;

  @override
  void initState() {
    super.initState();
    _currentValues = List.from(widget.initialValues); // Initialize values
  }

  void _incrementValue(int index) {
    setState(() {
      _currentValues[index]++;
    });
    widget.onValueChanged(index, _currentValues[index]); // Trigger callback
  }

  void _decrementValue(int index) {
    setState(() {
      _currentValues[index]--;
    });
    widget.onValueChanged(index, _currentValues[index]); // Trigger callback
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.titles.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15), // Spacing between containers
          child: Container(
            width: 165, // Container width
            height: 155, // Container height
            decoration: BoxDecoration(
              color: const Color(0xFF1c1c34), // Background color
              borderRadius: BorderRadius.circular(10.0), // Border radius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.titles[index],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 122, 97, 165),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ), // Display the title
                Text(
                  _currentValues[index].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ), // Display the value
                const SizedBox(height: 2, width: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      color: const Color(0xFF484a5a), // Background color for the decrement button
                      borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                        onTap: () => _decrementValue(index),
                        child: IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white, size: 35),
                          onPressed: () => _decrementValue(index),
                          splashColor: Colors.transparent, // Optional: Remove splash effect
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Material(
                      color: const Color(0xFF484a5a), // Background color for the increment button
                      borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                        onTap: () => _incrementValue(index),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white, size: 35),
                          onPressed: () => _incrementValue(index),
                          splashColor: Colors.transparent, // Optional: Remove splash effect
                        ),
                      ),
                    ),
                  ],
                ), // Add and remove buttons
              ],
            ),
          ),
        );
      }),
    );
  }
}
