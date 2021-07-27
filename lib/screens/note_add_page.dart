import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/bloc/note/note_bloc.dart';
import 'package:notepad/models/note.dart';

class NoteAddPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Add Page'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          Note note = Note(name: nameController.text, content: contentController.text);
          try{
            BlocProvider.of<NoteBloc>(context).add(AddNote(note));
            Navigator.pop(context);
          } catch (e){
            throw Exception('Error in add note');
          }
        }, icon: Icon(Icons.save))],
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
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8,),
            TextFormField(
              controller: contentController,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Content',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
