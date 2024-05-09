import 'package:equatable/equatable.dart';

abstract class AddNotePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddNotePageEmptyState extends AddNotePageState {}

class AddNotePageSuccessState extends AddNotePageState {
  final String message;

  AddNotePageSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class AddNotePageFailedState extends AddNotePageState {
  final String message;

  AddNotePageFailedState(this.message);

  @override
  List<Object> get props => [message];
}
