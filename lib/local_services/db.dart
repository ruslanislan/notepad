import 'package:notepad/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  static final Db instance = Db._init();

  static Database? _database;

  Db._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final uuidType = "TEXT PRIMARY KEY";
    final boolType = "BOOLEAN NOT NULL";
    final intType = "INTEGER NOT NULL";
    final textType = "TEXT NOT NULL";
    final timestampType = 'DATETIME DEFAULT CURRENT_TIMESTAMP';

    await db.execute('''
    CREATE TABLE $tableNotes (
      ${NoteFields.id} $idType,
      ${NoteFields.name} $textType,
      ${NoteFields.content} $textType,
      ${NoteFields.createdAt} $textType,
      ${NoteFields.updatedAt} $textType
    )
    ''');
  }

  Future<void> close() async {
    final Database db = await instance.database;
    db.close();
  }
}
