import 'package:my_notes_app/data/datasources/database_helper.dart';
import 'package:my_notes_app/data/models/note_table.dart';
import 'package:my_notes_app/utils/excption.dart';

abstract class NoteLocalDataSource {
  Future<String> insertNote(NoteTable notes);
  Future<String> removeNote(NoteTable notes);
  Future<List<NoteTable>> getAllNotes();
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final DatabaseHelper databaseHelper;

  NoteLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<NoteTable>> getAllNotes() async {
    final result = await databaseHelper.getNotesList();
    return result.map((data) => NoteTable.fromMap(data)).toList();
  }

  @override
  Future<String> insertNote(NoteTable notes) async {
    try {
      await databaseHelper.insertNote(notes);
      return 'Insert Success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeNote(NoteTable notes) async {
    try {
      await databaseHelper.removeNote(notes);
      return 'remove notes success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
