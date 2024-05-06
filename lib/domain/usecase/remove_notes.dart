import 'package:dartz/dartz.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/domain/repositories/note_repository.dart';
import 'package:my_notes_app/utils/failure.dart';

class RemoveNotes {
  final NoteRepository noteRepository;

  RemoveNotes(this.noteRepository);

  Future<Either<Failure, String>> execute(Note note) {
    return noteRepository.removeNotes(note);
  }
}
