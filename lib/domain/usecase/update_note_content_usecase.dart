import 'package:dartz/dartz.dart';
import 'package:my_notes_app/domain/repositories/note_repository.dart';
import 'package:my_notes_app/utils/failure.dart';

class UpdateNoteContentUsecase {
  final NoteRepository noteRepository;

  UpdateNoteContentUsecase(this.noteRepository);

  Future<Either<Failure, bool>> execute(
      int id, String newIsi, String newTitle) {
    return noteRepository.updateNoteContent(id, newIsi, newTitle);
  }
}
