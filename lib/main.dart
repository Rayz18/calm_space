import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(CalmSpaceApp());
}

class CalmSpaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFA3D1E6), // Light blue background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50), // Space at the top
            Text(
              'Calm Space',
              style: TextStyle(
                fontFamily: 'Cursive',
                fontSize: 73,
                color: Colors.black,
              ),
            ),
            Text(
              'A Mental Health Companion',
              style: TextStyle(
                fontFamily: 'Cursive',
                fontSize: 45,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40), // Space between text and image
            ClipOval(
              child: Image.asset(
                'assets/photos/calm.png', // Replace with your image asset
                height: 150,
                width: 175,
                fit: BoxFit.fill, // Ensure the image fits within the circle
              ),
            ),
            SizedBox(height: 35), // Space between image and quote
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                '“It’s okay not to be okay. It’s okay to ask for help.\n "It’s okay to take a break”',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'AppleGaramond',
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 30), // Space between quote and button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF68BBE3), // Button background color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 50), // Space at the bottom
          ],
        ),
      ),
    );
  }
}
