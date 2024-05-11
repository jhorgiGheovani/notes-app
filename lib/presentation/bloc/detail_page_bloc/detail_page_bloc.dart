import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/domain/usecase/get_note_detail_usecase.dart';
import 'package:my_notes_app/domain/usecase/remove_notes.dart';
import 'package:my_notes_app/domain/usecase/update_note_content_usecase.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_event.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_state.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  final GetNoteDetailUseCase _getNoteDetailUseCase;
  final UpdateNoteContentUsecase _updateNoteContentUsecase;
  final RemoveNotes _removeNotes;

  DetailPageBloc(this._getNoteDetailUseCase, this._updateNoteContentUsecase,
      this._removeNotes)
      : super(DetailPageEmptyState()) {
    //get note details
    on<GetDetailNoteEvent>((event, emit) async {
      final id = event.id;
      // emit(DetailPageFailedState(id))
      final result = await _getNoteDetailUseCase.execute(id);

      result.fold((failure) {
        emit(DetailPageFailedState(failure.message));
      }, (data) {
        emit(DetailPageLoadedDataState(data));
      });
    });

    on<UpdateNoteContentEvent>((event, emit) async {
      final id = event.id;
      final newTitle = event.newTitle;
      final newIsi = event.newIsi;

      final result =
          await _updateNoteContentUsecase.execute(id, newIsi, newTitle);

      result.fold((failure) {
        emit(DetailPageFailedState(failure.message));
      }, (success) {
        emit(DetailPageSuccessState("sukses update content note"));
      });
    });

    on<RemoveNoteEvent>((event, emit) async {
      final noteId = event.id;

      final result = await _removeNotes.execute(noteId);

      result.fold((failure) => emit(DetailPageFailedState(failure.message)),
          (success) => emit(DetailPageSuccessState(success)));
    });
  }
}
