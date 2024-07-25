import 'package:calm_space/main.dart';
import 'package:flutter/material.dart';
import 'coping_tips.dart';
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
            fontFamily: 'Sans',
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalmSpaceApp()),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 233, 222, 236),
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.80,
            colors: [
              Color(0xFFFADADD), // Pastel Pink
              Color(0xF68AE5F5), // Pastel Blue
            ],
          ),
        ),
        child: Padding(
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
                      color: Color(0xDFDAB8F1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JournalPage()),
                        );
                      },
                    ),
                    SizedBox(height: 40),
                    HomeButton(
                      iconPath: 'assets/photos/mood_tracking.png',
                      text: 'Mood Tracking',
                      color: Color(0xDFDAB8F1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoodTrackingPage(
                                    moodRecords: {},
                                  )), // Navigate to MoodTrackingPage
                        );
                      },
                    ),
                    SizedBox(height: 40),
                    HomeButton(
                      iconPath: 'assets/photos/coping_tips.png',
                      text: 'Coping Tips',
                      color: Color(0xDFDAB8F1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CopingTipsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                fontFamily: 'Sans',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
