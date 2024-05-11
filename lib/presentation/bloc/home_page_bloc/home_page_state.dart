import 'package:equatable/equatable.dart';
import 'package:my_notes_app/domain/entities/note.dart';

abstract class HomePageState extends Equatable {
  HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageEmptyState extends HomePageState {}

class HomePageEmptDataState extends HomePageState {
  final String message;
  HomePageEmptDataState(this.message);

  @override
  List<Object> get props => [message];
}

class HomePageSuccessState extends HomePageState {
  final String message;

  HomePageSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class HomePageFailedState extends HomePageState {
  final String message;

  HomePageFailedState(this.message);

  @override
  List<Object> get props => [message];
}

class HomePageLoadedDataState extends HomePageState {
  final List<Note> result;

  HomePageLoadedDataState(this.result);

  @override
  List<Object> get props => [result];
}
