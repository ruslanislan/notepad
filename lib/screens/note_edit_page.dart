import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/bloc/note/note_bloc.dart';
import 'package:notepad/models/note.dart';

class NoteEditPage extends StatelessWidget {
  final nameController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context)!.settings.arguments as Note;
    nameController.text = note.name;
    contentController.text = note.content;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit note'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Note updateNote = Note(
                    id: note.id,
                    name: nameController.text,
                    content: contentController.text,
                    createdAt: note.createdAt,
                    updatedAt: DateTime.now().toIso8601String());
                try {
                  BlocProvider.of<NoteBloc>(context)
                      .add(UpdateNote(updateNote));
                  Navigator.pop(context);
                } catch (e) {
                  throw Exception('Error in add note');
                }
              },
              icon: Icon(Icons.save)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              maxLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: contentController,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Content',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
