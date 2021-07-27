import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/app_consts/route_consts.dart';
import 'package:notepad/bloc/note/note_bloc.dart';
import 'package:notepad/local_services/note_service.dart';
import 'package:notepad/screens/note_add_page.dart';
import 'package:notepad/screens/note_detail_page.dart';
import 'package:notepad/screens/notes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteService _notesService = NoteService();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteBloc>(create: (_) => NoteBloc(_notesService)..add(LoadNotes()))
      ],
      child: MaterialApp(
        initialRoute: NOTES_PAGE,
        routes: {
          NOTES_PAGE: (_) => NotesPage(),
          NOTE_DETAIL_PAGE: (_) => NoteDetailPage(),
          NOTE_ADD_PAGE: (_) => NoteAddPage(),
        },
      ),
    );
  }
}
