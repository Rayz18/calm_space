import 'package:flutter/material.dart';

class DeepBreathingExercisePage extends StatelessWidget {
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
                'Deep Breathing Exercise',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Deep breathing helps calm the mind and body.',
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
              text: 'Find a comfortable, quiet place to sit or lie down.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.air,
              text:
                  'Close your eyes and take a slow, deep breath in through your nose, counting to four.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.pause,
              text: 'Hold your breath for a count of four.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.exposure_minus_1,
              text: 'Exhale slowly through your mouth, counting to four.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.timer,
              text:
                  'Repeat this process for 5-10 minutes, focusing on your breath.',
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
