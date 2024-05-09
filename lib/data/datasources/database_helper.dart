import 'package:my_notes_app/data/models/note_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  // static const String _tblWatchlist = 'notestable';
  static const String _tblNotes = 'notestable';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/notes.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblNotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        isi TEXT,
        tanggal TEXT
      );
    ''');
  }

  Future<int> insertNote(NoteTable noteTable) async {
    final db = await database;
    return await db!.insert(_tblNotes, noteTable.toJson());
  }

  Future<int> removeNote(NoteTable noteTable) async {
    final db = await database;
    return await db!
        .delete(_tblNotes, where: 'id = ?', whereArgs: [noteTable.id]);
  }

  Future<List<Map<String, dynamic>>> getNotesList() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblNotes);
    return results;
  }

  Future<Map<String, dynamic>?> getNoteById(int id) async {
    final db = await database;
    final results =
        await db!.query(_tblNotes, where: 'id = ?', whereArgs: [id]);
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<int> updateNoteContent(int id, String newIsi, String newTitle) async {
    final db = await database;
    return await db!.update(_tblNotes, {'title': newTitle, 'isi': newIsi},
        where: 'id = ?', whereArgs: [id]);
  }
}
