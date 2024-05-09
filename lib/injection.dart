import 'package:get_it/get_it.dart';
import 'package:my_notes_app/data/datasources/database_helper.dart';
import 'package:my_notes_app/data/datasources/note_local_data_source.dart';
import 'package:my_notes_app/data/repositories/notes_repository_impl.dart';
import 'package:my_notes_app/domain/repositories/note_repository.dart';
import 'package:my_notes_app/domain/usecase/get_note_detail_usecase.dart';
import 'package:my_notes_app/domain/usecase/get_notes_list.dart';
import 'package:my_notes_app/domain/usecase/insert_notes.dart';
import 'package:my_notes_app/domain/usecase/remove_notes.dart';
import 'package:my_notes_app/domain/usecase/update_note_content_usecase.dart';
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_bloc.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => HomePageBloc(locator()));
  locator.registerFactory(() => DetailPageBloc(locator(), locator()));
  locator.registerFactory(() => AddNotePageBloc(locator()));
  //use case
  locator.registerLazySingleton(() => GetNotesList(locator()));
  locator.registerLazySingleton(() => InsertNote(locator()));
  locator.registerLazySingleton(() => RemoveNotes(locator()));
  locator.registerLazySingleton(() => GetNoteDetailUseCase(locator()));
  locator.registerLazySingleton(() => UpdateNoteContentUsecase(locator()));
  //repository
  locator.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(noteLocalDataSource: locator()));

  //data source
  locator.registerLazySingleton<NoteLocalDataSource>(
      () => NoteLocalDataSourceImpl(databaseHelper: locator()));

  // database helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
