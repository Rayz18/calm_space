import 'package:flutter/material.dart';
import 'home_page.dart';
import 'deep_breathing_exercise.dart';
import 'mindfulness_meditation.dart';

class CopingTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coping Tips'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
        body: PageView(
          children: [
            StressReductionPage(),
            AnxietyControlPage(),
            DepressionInfoPage(),
            EmotionalSelfControlPage(),
            ConcentrationTipsPage(),
            DeepBreathingExercisePage(),
            MindfulnessMeditationPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility), label: 'Stress Reduction'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'Anxiety Control'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), label: 'Depression Info'),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_new),
                label: 'Emotional Self-control'),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_rounded),
                label: 'Concentration Tips'),
            BottomNavigationBarItem(
                icon: Icon(Icons.air), label: 'Deep Breathing'),
            BottomNavigationBarItem(
                icon: Icon(Icons.air_rounded), label: 'Mindfulness Meditation'),
          ],
          onTap: (index) {
            // Implement navigation logic if necessary
          },
        ),
      ),
    );
  }
}

class StressReductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Stress Reduction',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Meditation can wipe away the day\'s stress,\nbringing with it inner peace.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            _buildStep(
              icon: Icons.self_improvement,
              text:
                  'Sit or lie down in a comfortable position in a quiet place where you won’t be disturbed.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.headset_mic,
              text:
                  'Observe your thoughts without judgment as they come and go. Start from your toes and move upwards. Pay attention to each part of your body, noticing any sensations, tension, or relaxation.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.restaurant,
              text:
                  'Eat a balanced diet rich in fruits, vegetables, lean proteins, and whole grains.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.bedtime,
              text:
                  'Take short breaks throughout the day to rest and recharge.',
            ),
            SizedBox(height: 16),
            _buildStep(
              icon: Icons.sports_basketball,
              text:
                  'Spend time on activities you enjoy, whether it\'s reading, gardening, painting, or playing a musical instrument.',
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

class AnxietyControlPage extends StatelessWidget {
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
                'Anxiety Control',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'It\'s stepping away from the hustle and bustle of our anxious thoughts and into a space of calm and clarity',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 16),
            _buildTip(Icons.self_improvement,
                'Let go of expectations. Sometimes, we can be our own harshest critics, expecting immediate peace the moment we close our eyes.'),
            _buildTip(Icons.local_florist,
                'Choose an object in your environment, such as a plant or a candle flame. Instead of feeling bad for having thoughts, recognize them, and gently return your focus to your breath or task.'),
            _buildTip(Icons.self_improvement,
                'Silently repeat phrases like, "This feeling will pass, Calm, I am safe, I am stronger than my anxiety and I have overcome anxiety before; I can do it again."'),
            _buildTip(Icons.directions_walk,
                'Find a quiet place to walk slowly. Pay attention to the sensations of each step: the feeling of your feet touching the ground, the movement of your legs, and your breath.'),
            _buildTip(Icons.people,
                'Meditating with others, either in person or virtually, can provide support and motivation.'),
          ],
        ),
      ),
    );
  }

  Widget _buildTip(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 40),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class DepressionInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Depression',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              'Meditation can naturally aid in alleviating depression by promoting relaxation and strengthening the immune system.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(height: 16),
          _buildInfoSection(
            icon: Icons.fitness_center,
            title: 'Physical activity',
            description:
                'Physical activity can boost endorphins and serotonin, which can improve mood. Aim for at least 30 minutes of moderate exercise most days of the week.',
          ),
          _buildInfoSection(
            icon: Icons.restaurant,
            title: 'Balanced diet',
            description:
                'Eating a balanced diet rich in nutrients can positively affect your mood and energy levels. Omega-3 fatty acids, found in fish and flaxseeds, and complex carbohydrates can be particularly beneficial.',
          ),
          _buildInfoSection(
            icon: Icons.bed,
            title: 'Sleep schedule',
            description:
                'Establishing a regular sleep schedule and creating a restful environment can improve sleep quality, which is crucial for mental health.',
          ),
          _buildInfoSection(
            icon: Icons.people,
            title: 'Connections',
            description:
                'Maintaining connections with friends, family, or support groups can provide emotional support and reduce feelings of isolation.',
          ),
          _buildInfoSection(
            icon: Icons.self_improvement,
            title: 'Self-kindness',
            description:
                'Practice self-kindness and avoid self-criticism. Understanding that it\'s okay to have struggles and that you\'re not alone can be comforting.',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmotionalSelfControlPage extends StatelessWidget {
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
                'Emotional Self-control',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Managing your emotions effectively to respond to situations in a balanced way',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InfoSection(
              icon: Icons.search,
              title: 'Identify and understand your emotional triggers.',
              description:
                  'Being aware of what causes strong emotional reactions can help you prepare and respond more thoughtfully.',
            ),
            InfoSection(
              icon: Icons.spa,
              title:
                  'Use deep breathing exercises to calm your nervous system when you feel overwhelmed.',
              description:
                  'Slow, deep breaths can help lower stress and anxiety.',
            ),
            InfoSection(
              icon: Icons.pause_circle_filled,
              title:
                  'Before reacting to a situation, take a moment to pause and reflect.',
              description:
                  'This can help you avoid impulsive decisions and respond more thoughtfully.',
            ),
            InfoSection(
              icon: Icons.people,
              title: 'Try to understand others’ perspectives and feelings.',
              description:
                  'Empathy can help you respond with compassion and patience rather than frustration.',
            ),
            InfoSection(
              icon: Icons.lock,
              title:
                  'Establish and communicate clear boundaries to protect your emotional well-being.',
              description:
                  'This helps prevent situations that may overwhelm you.',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  InfoSection(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 40.0),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
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

class ConcentrationTipsPage extends StatelessWidget {
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
                'Concentration Issues',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Improving concentration can be beneficial for productivity and overall well-being',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
            _buildTip(
              icon: Icons.check_circle_outline,
              title:
                  'Define specific, achievable goals for what you want to accomplish. Breaking tasks into smaller steps can make them feel more manageable and help maintain focus.',
            ),
            SizedBox(height: 20),
            _buildTip(
              icon: Icons.home_outlined,
              title:
                  'Designate a quiet, organized space for work or study. Minimize distractions by turning off notifications and keeping your workspace tidy.',
            ),
            SizedBox(height: 20),
            _buildTip(
              icon: Icons.timer,
              title:
                  'Use the Pomodoro technique: work in focused intervals, such as 25 minutes, followed by a short break. This can help maintain concentration and prevent burnout.',
            ),
            SizedBox(height: 20),
            _buildTip(
              icon: Icons.self_improvement,
              title:
                  'Allow yourself short breaks to rest and recharge. Short breaks can prevent mental fatigue and improve overall productivity.',
            ),
            SizedBox(height: 20),
            _buildTip(
              icon: Icons.task_alt,
              title:
                  'Focus on one task at a time to improve efficiency and concentration. Multitasking can reduce the quality of your work and make it harder to concentrate.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTip({required IconData icon, required String title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, size: 40),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
