import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';

class NotesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final List<Note> _notes = [];
    print(_notes.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Page'),
        centerTitle: true,
      ),
      body: _notes.isEmpty
          ? CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      //getIt<NoteProvider>().getOne(index + 1);
                      Navigator.pushNamed(context, '/noteDetailPage');
                    },
                    child: Container(
                      height: 150,
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ID: ${_notes[index].id}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '${_notes[index].name}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${_notes[index].content}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${_notes[index].createdAt.toIso8601String()}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _notes.length,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
    );
  }
}
