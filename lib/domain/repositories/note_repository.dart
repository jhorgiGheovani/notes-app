import 'package:dartz/dartz.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/utils/failure.dart';

abstract class NoteRepository {
  Future<Either<Failure, String>> saveNotes(Note note);
  Future<Either<Failure, String>> removeNotes(Note note);
  Future<Either<Failure, List<Note>>> getNotesList();
}