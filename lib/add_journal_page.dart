import 'package:flutter/material.dart';

class AddJournalPage extends StatelessWidget {
  final Function(String, String) onSubmit;

  AddJournalPage({required this.onSubmit});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Story',
          style: TextStyle(
            fontFamily: 'Sans',
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0xEBBAEAF1),
      ),
      body: Container(
        color: Color(0xEBBAEAF1),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontFamily: 'Sans',
                ),
              ),
              style: TextStyle(
                fontFamily: 'Sans',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Story',
                labelStyle: TextStyle(
                  fontFamily: 'Sans',
                ),
              ),
              maxLines: 10,
              style: TextStyle(
                fontFamily: 'Sans',
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String story = _storyController.text;
                onSubmit(title, story);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(223, 198, 173, 214),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Sans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
