import 'package:flutter/material.dart';
import 'journal_page.dart';
import 'mood_tracker_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calm Space, Calm Mind',
          style: TextStyle(
            fontFamily: 'AppleGaramond',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFA3D1E6),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeButton(
                    iconPath: 'assets/photos/journaling.png',
                    text: 'Journaling',
                    color: Color(0xFF1A73E8),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JournalPage()),
                      );
                    },
                  ),
                   SizedBox(height: 40),
                  HomeButton(
                    iconPath: 'assets/photos/mood_tracking.png',
                    text: 'Mood Tracking',
                    color: Color(0xFF1A73E8),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MoodTrackingPage()), // Navigate to MoodTrackingPage
                      );
                    },
                  ),
                  SizedBox(height: 40),
                  HomeButton(
                    iconPath: 'assets/photos/mood_tracking.png',
                    text: 'Mood Tracking',
                    color: Color(0xFF1A73E8),
                    onPressed: () {
                      // Add navigation to Mood Tracking page
                    },
                  ),
                  SizedBox(height: 40),
                  HomeButton(
                    iconPath: 'assets/photos/coping_tips.png',
                    text: 'Coping Tips',
                    color: Color(0xFF1A73E8),
                    onPressed: () {
                      // Add navigation to Coping Tips page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  HomeButton({
    required this.iconPath,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 80,
              width: 80,
            ),
            SizedBox(width: 30),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'AppleGaramond',
                fontSize: 27,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
