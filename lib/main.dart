import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/views/note_add_page.dart';
import 'package:notepad/views/note_detail_page.dart';
import 'package:notepad/views/notes_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/notesPage',
    routes: {
      '/notesPage': (_) => NotesPage(),
      '/noteDetailPage': (_) => NoteDetailPage(),
      '/noteAddPage': (_) => NoteAddPage(),
    },
  ));
}
