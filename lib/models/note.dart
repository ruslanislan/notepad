final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [id, name, content, createdAt, updatedAt];

  static final String id = 'id';
  static final String name = 'name';
  static final String content = 'content';
  static final String createdAt = 'createdAt';
  static final String updatedAt = 'updatedAt';
}

class Note {
  final int? id;
  final String name;
  final String content;
  final String? createdAt;
  final String? updatedAt;

  Note(
      {this.id,
      required this.name,
      required this.content,
      this.createdAt,
      this.updatedAt});

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int,
        name: json[NoteFields.name] as String,
        content: json[NoteFields.content] as String,
        createdAt: json[NoteFields.createdAt] as String,
        updatedAt: json[NoteFields.updatedAt] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.name: name,
        NoteFields.content: content,
        NoteFields.createdAt: createdAt,
        NoteFields.updatedAt: updatedAt,
      };

  Note copy(
          {required int id}) =>
      Note(
        id: id,
        name: this.name,
        content: this.content,
        createdAt: this.createdAt,
        updatedAt: this.updatedAt,
      );
}
