import 'package:flutter/material.dart';
import 'home_page.dart';
import 'journal_page.dart';
import 'add_journal_page.dart';
import 'mood_tracker_page.dart';
import 'mood_calendar_page.dart';

void main() {
  runApp(CalmSpaceApp());
}

class CalmSpaceApp extends StatelessWidget {
  final Map<DateTime, String> moodRecords = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(moodRecords: moodRecords),
      routes: {
        '/home': (context) => HomePage(),
        '/journal': (context) => JournalPage(),
        '/add_journal': (context) => AddJournalPage(
              onSubmit: (title, story) {
                print('Submitted title: $title, story: $story');
              },
            ),
      
        '/mood_tracking': (context) => MoodTrackingPage(moodRecords: moodRecords),
        '/mood_calendar': (context) => MoodCalendarPage(
          moodRecords: moodRecords,
          selectedDate: DateTime.now(), // Provide a valid DateTime object here
        ),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  final Map<DateTime, String> moodRecords;

  SplashScreen({required this.moodRecords});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFA3D1E6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
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
            SizedBox(height: 40),
            ClipOval(
              child: Image.asset(
                'assets/photos/calm.png',
                height: 150,
                width: 175,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 35),
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
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF68BBE3),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
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
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
