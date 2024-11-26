import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "images/logo.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.78, // Adjust the button position based on screen height
          left: MediaQuery.of(context).size.width * 0.3, // Center the button horizontally
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              elevation: 0.3,
              minimumSize: const Size(150, 50), // Define the minimum button size
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("signin");
            },
            child: const Text("Get Started"),
          ),
        )
      ],
    );
  }
}
