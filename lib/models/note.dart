final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id, name, content, createdAt, updatedAt
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String content = 'content';
  static final String createdAt = 'createdAt';
  static final String updatedAt = 'updatedAt';
}

class Note {
  final int id;
  final String name;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  Note({this.id, this.name, this.content, this.createdAt, this.updatedAt}) : assert ( name != null && content !=null);

  static Note fromJson(Map<String, Object> json) => Note(
    id: json[NoteFields.id] as int,
    name: json[NoteFields.name] as String,
    content: json[NoteFields.content] as String,
    createdAt: DateTime.parse(json[NoteFields.createdAt] as String),
    updatedAt: DateTime.parse(json[NoteFields.updatedAt] as String) ,
  );

  Map<String, Object> toJson() => {
    NoteFields.id: id,
    NoteFields.name: name,
    NoteFields.content: content,
    NoteFields.createdAt: createdAt.toIso8601String(),
    NoteFields.updatedAt: updatedAt.toIso8601String(),
  };

  Note copy({
    int id,
    String name,
    String content,
    DateTime createAt,
    DateTime updateAt
  }) => Note(
    id: this.id,
    name: this.name,
    content: this.content,
    createdAt: this.createdAt,
    updatedAt: this.updatedAt,
  );
}