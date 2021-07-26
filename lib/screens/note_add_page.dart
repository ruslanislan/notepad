import 'package:flutter/material.dart';

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
          try{
            // getX((NoteProvider x) => x.addNote(Note(
            //     name: nameController.text,
            //     content: contentController.text,
            //     createdAt: DateTime.now(),
            //     updatedAt: DateTime.now()
            // )));
            Navigator.pop(context);
            //print('dada');
          } catch (e){

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
  void onPressed() {

  }
}
