import 'package:my_notes_app/data/datasources/database_helper.dart';
import 'package:my_notes_app/data/models/note_table.dart';
import 'package:my_notes_app/utils/excption.dart';

abstract class NoteLocalDataSource {
  Future<String> insertNote(NoteTable notes);
  Future<String> removeNote(NoteTable notes);
  Future<List<NoteTable>> getAllNotes();
  Future<NoteTable?> getNoteById(int id);
  Future<bool> updateNoteContent(int id, String newTitle, String newIsi);
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

  @override
  Future<NoteTable?> getNoteById(int id) async {
    final result = await databaseHelper.getNoteById(id);
    if (result != null) {
      return NoteTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<bool> updateNoteContent(int id, String newTitle, String newIsi) async {
    try {
      await databaseHelper.updateNoteContent(id, newIsi, newTitle);
      return true;
    } catch (e) {
      return false;
    }
  }
}
