import 'package:flutter/material.dart';
import 'mood_calendar_page.dart';
import 'home_page.dart';

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
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _saveMood() {
    if (selectedMood != null) {
      setState(() {
        widget.moodRecords[selectedDate] = selectedMood;
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a mood')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  'HOW WAS YOUR DAY?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _selectDate(context),
                    icon: Icon(Icons.calendar_today),
                    label: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () => _selectTime(context),
                    icon: Icon(Icons.access_time),
                    label: Text(selectedTime.format(context)),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: moods.entries.map((entry) {
                  return _buildMoodIcon(context, entry.value, entry.key);
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMood,
                child: Text('Save'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodIcon(BuildContext context, String iconPath, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = label;
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedMood == label ? Colors.blue : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              iconPath,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}

