import 'package:flutter/material.dart';
import 'home_page.dart';
import 'mood_calendar_page.dart';

class MoodTrackingPage extends StatefulWidget {
  final Map<DateTime, String> moodRecords;

  MoodTrackingPage({required this.moodRecords});

  @override
  _MoodTrackingPageState createState() => _MoodTrackingPageState();
}

class _MoodTrackingPageState extends State<MoodTrackingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedMood = "Unknown";

  final Map<String, String> moods = {
    "Calm": "assets/photos/calm_.png",
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

  void _saveMood() {
    DateTime dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    setState(() {
      widget.moodRecords[dateTime] = selectedMood;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoodCalendarPage(
          moodRecords: widget.moodRecords,
          selectedDate: DateTime.now(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mood Tracking',
            style: TextStyle(
              fontFamily: 'Sans',
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoodCalendarPage(
                      moodRecords: widget.moodRecords,
                      selectedDate: DateTime.now(),
                    ),
                  ),
                );
              },
            ),
          ],
          backgroundColor: Colors.purple[100], // Pastel purple color
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFC0CB), // Pastel pink
                Color(0xFFADD8E6), // Pastel blue
                Color(0xFFDDA0DD), // Pastel purple
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  "Track Your Mood",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    "Select date: ${selectedDate.toLocal()}".split(' ')[0],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text("Select time: ${selectedTime.format(context)}"),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: selectedMood,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMood = newValue!;
                    });
                  },
                  items: moods.keys.map((String mood) {
                    return DropdownMenuItem<String>(
                      value: mood,
                      child: Text(mood),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveMood,
                  child: Text("Save Mood"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
