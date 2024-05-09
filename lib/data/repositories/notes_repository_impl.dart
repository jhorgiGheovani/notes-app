import 'package:dartz/dartz.dart';
import 'package:my_notes_app/data/datasources/note_local_data_source.dart';
import 'package:my_notes_app/data/models/note_table.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/domain/repositories/note_repository.dart';
import 'package:my_notes_app/utils/excption.dart';
import 'package:my_notes_app/utils/failure.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  NoteRepositoryImpl({required this.noteLocalDataSource});
  @override
  Future<Either<Failure, List<Note>>> getNotesList() async {
    final result = await noteLocalDataSource.getAllNotes();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<Either<Failure, String>> removeNotes(Note note) async {
    try {
      final result =
          await noteLocalDataSource.removeNote(NoteTable.fromEntity(note));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveNotes(Note note) async {
    try {
      final result =
          await noteLocalDataSource.insertNote(NoteTable.fromEntity(note));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, Note>> getNoteById(int id) async {
    try {
      final result = await noteLocalDataSource.getNoteById(id);
      return Right(result!.toEntity());
    } catch (e) {
      return Left(CommonFailure("Failed to load details"));
    }
  }

  @override
  Future<Either<Failure, bool>> updateNoteContent(
      int id, String newIsi, String newTitle) async {
    try {
      final result =
          await noteLocalDataSource.updateNoteContent(id, newTitle, newIsi);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }
}
