import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> labels;
  final List<VoidCallback> onPressedCallbacks;

  const Gender({
    Key? key,
    required this.imagePaths,
    required this.labels,
    required this.onPressedCallbacks,
  }) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _selectedIndex = 0; // Set to 0 to make "male" selected initially

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onPressedCallbacks[index](); // Call the callback for the selected button
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.imagePaths.length, (index) {
        bool isSelected = _selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15), // Adds spacing between buttons
          child: Container(
            width: 165, // Container width
            height: 155, // Container height
            decoration: BoxDecoration(
              color: isSelected ? const Color.fromARGB(255, 20, 20, 37) : const Color(0xFF1c1c34), // Change color if selected
              borderRadius: BorderRadius.circular(10.0), // Set the border radius
            ),
            child: TextButton(
              onPressed: () => _onButtonPressed(index),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent, // Ensure the button background is transparent
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    widget.imagePaths[index],
                    width: 60,
                    height: 60,
                  ), // Display the image
                  const SizedBox(height: 10), // Add spacing between image and text
                  Text(
                    widget.labels[index],
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 122, 97, 165), // Ensure the text color is readable
                    ),
                  ), // Display the label
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
