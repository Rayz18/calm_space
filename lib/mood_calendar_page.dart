import 'package:flutter/material.dart';
import 'mood_tracker_page.dart';

class MoodCalendarPage extends StatefulWidget {
  final DateTime selectedDate;
  final Map<DateTime, String> moodRecords;

  MoodCalendarPage({required this.selectedDate, required this.moodRecords});

  @override
  _MoodCalendarPageState createState() => _MoodCalendarPageState();
}

class _MoodCalendarPageState extends State<MoodCalendarPage> {
  late DateTime _displayedMonth;
  String? selectedMood;

  @override
  void initState() {
    super.initState();
    _displayedMonth =
        DateTime(widget.selectedDate.year, widget.selectedDate.month);
  }

  @override
  void didUpdateWidget(covariant MoodCalendarPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _displayedMonth =
        DateTime(widget.selectedDate.year, widget.selectedDate.month);
  }

  void _editMood(DateTime date) async {
    String? newMood = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoodTrackingPage(moodRecords: widget.moodRecords),
      ),
    );
    if (newMood != null) {
      setState(() {
        widget.moodRecords[date] = newMood;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getFormattedMonthYear(_displayedMonth)),
        backgroundColor: Colors.purple[100], // Pastel purple color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildMonthSelector(),
                SizedBox(height: 20),
                _buildCalendar(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getFormattedMonthYear(DateTime dateTime) {
    return "${_getMonthName(dateTime.month)} ${dateTime.year}";
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  Widget _buildMonthSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _displayedMonth =
                  DateTime(_displayedMonth.year, _displayedMonth.month - 1);
            });
          },
        ),
        Text(
          _getFormattedMonthYear(_displayedMonth),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              _displayedMonth =
                  DateTime(_displayedMonth.year, _displayedMonth.month + 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    int daysInMonth =
        DateTime(_displayedMonth.year, _displayedMonth.month + 1, 0).day;
    int startingWeekday =
        DateTime(_displayedMonth.year, _displayedMonth.month, 1).weekday;

    return Table(
      // Removing the border property makes the table lines invisible
      children: [
        TableRow(
          children: List.generate(7, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text([
                'Sun',
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat'
              ][index])),
            );
          }),
        ),
        for (var week = 0; week < 6; week++)
          TableRow(children: _buildWeek(startingWeekday, daysInMonth, week)),
      ],
    );
  }

  List<Widget> _buildWeek(int startingWeekday, int daysInMonth, int week) {
    List<Widget> widgets = [];

    for (int i = 0; i < 7; i++) {
      int day = (week * 7) + i + 1 - startingWeekday;
      DateTime date =
          DateTime(_displayedMonth.year, _displayedMonth.month, day);

      if (day > 0 && day <= daysInMonth) {
        String? mood = widget.moodRecords[date];
        widgets.add(
          GestureDetector(
            onTap: () => _editMood(date),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mood != null
                      ? _buildMoodEmoji(mood)
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                  SizedBox(height: 4),
                  Text(
                    '$day',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
        );
      }
    }

    return widgets;
  }

  Widget _buildMoodEmoji(String mood) {
    String imagePath;
    switch (mood) {
      case 'Calm':
        imagePath = 'assets/photos/calm_.png';
        break;
      case 'Happy':
        imagePath = 'assets/photos/happy.png';
        break;
      case 'Angry':
        imagePath = 'assets/photos/angry.png';
        break;
      case 'Sad':
        imagePath = 'assets/photos/sad.png';
        break;
      case 'Disappointed':
        imagePath = 'assets/photos/disappointed.png';
        break;
      case 'Scared':
        imagePath = 'assets/photos/scared.png';
        break;
      case 'Worried':
        imagePath = 'assets/photos/worried.png';
        break;
      case 'Frustrated':
        imagePath = 'assets/photos/frustrated.png';
        break;
      default:
        imagePath = 'assets/photos/unknown.png';
        break;
    }
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
