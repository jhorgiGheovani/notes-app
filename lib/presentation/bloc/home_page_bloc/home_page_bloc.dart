import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/domain/usecase/get_notes_list.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_event.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetNotesList _getNotesList;

  HomePageBloc(this._getNotesList) : super(HomePageEmptyState()) {
    on<LoadNotesList>((event, emit) async {
      final result = await _getNotesList.execute();

      result.fold((failure) => emit(HomePageFailedState(failure.message)),
          (data) => emit(HomePageLoadedDataState(data)));
    });
  }
}
