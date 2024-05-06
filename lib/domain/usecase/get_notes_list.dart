import 'package:dartz/dartz.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/domain/repositories/note_repository.dart';
import 'package:my_notes_app/utils/failure.dart';

class GetNotesList {
  final NoteRepository noteRepository;

  GetNotesList(this.noteRepository);
  Future<Either<Failure, List<Note>>> execute() {
    return noteRepository.getNotesList();
  }
}
