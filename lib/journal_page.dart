import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_journal_page.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  List<Map<String, String>> _stories = [];

  @override
  void initState() {
    super.initState();
    _loadStories();
  }

  _loadStories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? stories = prefs.getStringList('stories');
    if (stories != null) {
      setState(() {
        _stories = stories.map((story) {
          List<String> parts = story.split('||');
          return {'title': parts[0], 'story': parts[1], 'date': parts[2]};
        }).toList();
      });
    }
  }

  _addStory(String title, String story) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String date = DateTime.now().toString();
    setState(() {
      _stories.add({'title': title, 'story': story, 'date': date});
      List<String> stories = _stories
          .map((s) => '${s['title']}||${s['story']}||${s['date']}')
          .toList();
      prefs.setStringList('stories', stories);
    });
  }

  _deleteStory(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _stories.removeAt(index);
      List<String> stories = _stories
          .map((s) => '${s['title']}||${s['story']}||${s['date']}')
          .toList();
      prefs.setStringList('stories', stories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Journaling',
          style: TextStyle(
            fontFamily: 'AppleGaramond',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFA3D1E6), // Light blue background color
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFA3D1E6), // Light blue background color
        ),
        child: _stories.isEmpty
            ? Center(
                child: Text(
                  'No Available Story yet',
                  style: TextStyle(
                    fontFamily: 'AppleGaramond',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _stories.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        _stories[index]['title'] ?? '',
                        style: TextStyle(
                          fontFamily: 'AppleGaramond',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        _stories[index]['date'] ?? '',
                        style: TextStyle(
                          fontFamily: 'AppleGaramond',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteStory(index),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                _stories[index]['title'] ?? '',
                                style: TextStyle(
                                  fontFamily: 'AppleGaramond',
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              content: Text(
                                _stories[index]['story'] ?? '',
                                style: TextStyle(
                                  fontFamily: 'AppleGaramond',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                      fontFamily: 'AppleGaramond',
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddJournalPage(onSubmit: _addStory),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
