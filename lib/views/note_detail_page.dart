import 'package:flutter/material.dart';

class NoteDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Note _note = getX<NoteProvider((NoteProvider x) => x.note);
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        children: [
          Text(
            '{_note.name}',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'DateFormat.yMMMd().format(_note.createdAt)',
            style: TextStyle(color: Colors.black38),
          ),
          SizedBox(height: 8),
          Text(
            '{_note.content}',
            style: TextStyle(color: Colors.black54, fontSize: 18),
          )
        ],
      ),
    );
  }
}
