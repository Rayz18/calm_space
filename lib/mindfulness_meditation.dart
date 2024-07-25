import 'package:flutter/material.dart';

class MindfulnessMeditationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Mindfulness Meditation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Mindfulness helps you stay present and reduces stress.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.self_improvement,
              text:
                  'Sit in a comfortable position with your back straight and hands resting on your lap.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.face,
              text: 'Close your eyes and take a few deep breaths to settle in.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.air,
              text:
                  'Focus on your breath, noticing the sensation of air entering and leaving your nostrils.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.cloud,
              text:
                  'When your mind wanders, gently bring your focus back to your breath without judgment.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.timer,
              text:
                  'Continue this practice for 5-10 minutes, gradually increasing the time as you become more comfortable.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 40),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
