import 'package:dartz/dartz.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/domain/repositories/note_repository.dart';
import 'package:my_notes_app/utils/failure.dart';

class GetNoteDetailUseCase {
  final NoteRepository noteRepository;

  GetNoteDetailUseCase(this.noteRepository);
  Future<Either<Failure, Note>> execute(int id) {
    return noteRepository.getNoteById(id);
  }
}
