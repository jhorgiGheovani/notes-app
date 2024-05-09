import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/domain/usecase/insert_notes.dart';
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_event.dart';
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_state.dart';

class AddNotePageBloc extends Bloc<AddNotePageEvent, AddNotePageState> {
  final InsertNote _insertNote;

  AddNotePageBloc(this._insertNote) : super(AddNotePageEmptyState()) {
    on<SavedNote>((event, emit) async {
      final item = event.note;

      final result = await _insertNote.execute(item);

      await result.fold((failure) {
        emit(AddNotePageFailedState(failure.message));
      }, (success) {
        emit(AddNotePageSuccessState(success));
      });
    });
  }
}
