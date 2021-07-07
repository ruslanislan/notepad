import 'package:notepad/models/note.dart';
import 'package:sqflite/sqflite.dart';

import 'base.dart';

abstract class BaseLocalService<T>{

  Base base = Base.instance;

  Future<T> create(T model) async {
    final Database db = await base.database;

    final id = await db.insert(tableName, serialize(model));
    return copy(model, id);
  }

  Future<T> getOne(int id) async {
    final db = await base.database;

    final maps = await db.query(tableName,
        columns: fieldList,
        where: '$fieldId = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return deserialize(maps.first);
    }
    throw Exception('ID $id not found');
  }

  Future<List<T>> getAll() async {
    final Database db = await base.database;

    print("readAllNotes");
    //final orderBy = '${N.updatedAt} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);

    return deserializeList(result);
  }

  Future<int> update(T model) async {
    final Database db = await base.database;

    return db.update(
      tableNotes,
      serialize(model),
      where: '$fieldId = ?',
      whereArgs: [modelId(model)],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await base.database;

    return await db
        .delete(tableNotes, where: '$fieldId = ?', whereArgs: [id]);
  }

  Map<String, Object> serialize(T model);
  T deserialize(Map<String, Object> json);
  List<T> deserializeList(List<Map<String, Object>> result);
  T copy(T model, int id);
  int modelId(T model);
  List<String> get fieldList;
  String get fieldId;
  String get tableName;
  String get orderBy;
}