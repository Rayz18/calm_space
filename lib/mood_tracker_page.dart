import 'package:flutter/material.dart';

class MoodTrackingPage extends StatefulWidget {
  @override
  _MoodTrackingPageState createState() => _MoodTrackingPageState();
}

class _MoodTrackingPageState extends State<MoodTrackingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedMood = "Unknown";

  final Map<String, String> moods = {
    "Calm": "assets/photos/calm.png",
    "Happy": "assets/photos/happy.png",
    "Angry": "assets/photos/angry.png",
    "Sad": "assets/photos/sad.png",
    "Disappointed": "assets/photos/disappointed.png",
    "Scared": "assets/photos/scared.png",
    "Worried": "assets/photos/worried.png",
    "Frustrated": "assets/photos/frustrated.png",
    "Unknown": "assets/photos/unknown.png",
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOW WAS YOUR DAY?',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${selectedTime.format(context)}",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select time'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: moods.keys.map((mood) {
                return Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset(moods[mood]!),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selectedMood = mood;
                        });
                      },
                    ),
                    Text(mood),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save action here
                print("Mood: $selectedMood, Date: $selectedDate, Time: $selectedTime");
              },
              child: Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }
}
