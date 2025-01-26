// import 'package:flutter/material.dart';
// import 'package:testapp/labs/lab9/bday/program1screen.dart';
// import 'dart:async'; // For Timer
// import 'bday_card_demo.dart'; // Import Birthday Card Screen
//
// class SplashScreen extends StatefulWidget {
//   final String name; // Name passed from the input screen
//
//   SplashScreen({required this.name});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     // Simulate a splash screen delay (2 seconds)
//     Timer(Duration(seconds: 2), () {
//       // Navigate to the birthday card page after 2 seconds
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BdayCardDemo(name: widget.name), // Pass the name to the next screen
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FadeInImage(
//           placeholder: AssetImage('assets/lab8/splash_placeholder.png'), // Placeholder image
//           image: AssetImage('assets/lab8/finalBDAY.jpg'), // Splash screen background image
//           fit: BoxFit.cover,
//           fadeInDuration: Duration(seconds: 2), // Fade-in effect for the image
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:testapp/labs/lab9/bday/program1screen.dart';
import 'dart:async'; // For Timer
import 'bday_card_demo.dart'; // Import the Birthday Card Screen

class SplashScreen extends StatefulWidget {
  final String name; // Name passed from the input screen

  SplashScreen({required this.name});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay for loading, then navigate to the next screen
    Timer(Duration(seconds: 3), () {
      // Navigate to the Birthday Card screen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BdayCardDemo(name: widget.name), // Pass the name to the next screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent, // Birthday-themed color (pink)
      body: Stack(
        children: [
          // Background image for the splash screen
          Positioned.fill(
            child: FadeInImage(
              placeholder: AssetImage('assets/lab8/splash_placeholder.png'), // Placeholder while image loads
              image: AssetImage('assets/lab8/finalBDAY.jpg'), // Background image for the splash screen
              fit: BoxFit.cover,
              fadeInDuration: Duration(seconds: 2), // Fade-in effect duration
            ),
          ),
          // Full-screen circular progress indicator
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Spinner color (white)
                ),
                SizedBox(height: 20),
                // Text displayed with the loading indicator
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
