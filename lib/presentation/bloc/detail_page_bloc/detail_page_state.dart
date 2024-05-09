import 'package:equatable/equatable.dart';
import 'package:my_notes_app/domain/entities/note.dart';

abstract class DetailPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class DetailPageEmptyState extends DetailPageState {}

class DetailPageLoadedDataState extends DetailPageState {
  final Note result;

  DetailPageLoadedDataState(this.result);

  @override
  List<Object> get props => [result];
}

class DetailPageFailedState extends DetailPageState {
  final String message;
  DetailPageFailedState(this.message);

  @override
  List<Object> get props => [message];
}

class DetailPageSuccessState extends DetailPageState {
  final String message;
  DetailPageSuccessState(this.message);

  @override
  List<Object> get props => [message];
}
