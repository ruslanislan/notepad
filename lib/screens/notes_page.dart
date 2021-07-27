import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notepad/app_consts/route_consts.dart';
import 'package:notepad/bloc/note/note_bloc.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Page'),
        centerTitle: true,
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NoteNotLoaded) {
            return Center(
              child: Text(state.errorText),
            );
          }
          final notes = (state as NotesLoaded).notes;
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            itemBuilder: (context, index) {
              return Container(
                width: width,
                height: height / 4,
                child: Container(
                  height: 150,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ID: ${notes[index].id}',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '${notes[index].name}',
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${notes[index].content}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'created: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(
                            DateTime.parse(notes[index].createdAt! + '+00:00')
                                .toLocal(),
                          )}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'updated: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(
                            DateTime.parse(notes[index].updatedAt! + '+00:00')
                                .toLocal(),
                          )}'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: notes.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, NOTE_ADD_PAGE);
        },
      ),
    );
  }
// Widget da() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: ListView.builder(
//       itemBuilder: (context, int index) {
//         return InkWell(
//           onTap: () {
//             //getIt<NoteProvider>().getOne(index + 1);
//             Navigator.pushNamed(context, '/noteDetailPage');
//           },
//           child: Container(
//             height: 150,
//             child: Card(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'ID: ${_notes[index].id}',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Text(
//                           '${_notes[index].name}',
//                           style: TextStyle(fontSize: 24),
//                         ),
//                         Container(),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('${_notes[index].content}'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('${_notes[index].createdAt!.toIso8601String()}'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       itemCount: _notes.length,
//     ),
//   ),
// }
}
