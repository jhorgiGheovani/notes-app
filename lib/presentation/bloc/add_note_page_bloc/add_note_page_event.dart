import 'package:equatable/equatable.dart';
import 'package:my_notes_app/domain/entities/note.dart';

abstract class AddNotePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SavedNote extends AddNotePageEvent {
  final Note note;

  SavedNote(this.note);

  @override
  List<Object> get props => [note];
}
