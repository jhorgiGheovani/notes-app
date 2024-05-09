import 'package:equatable/equatable.dart';

abstract class DetailPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDetailNoteEvent extends DetailPageEvent {
  final int id;
  GetDetailNoteEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateNoteContentEvent extends DetailPageEvent {
  final int id;
  final String newTitle;
  final String newIsi;

  UpdateNoteContentEvent(this.id, this.newTitle, this.newIsi);

  @override
  List<Object> get props => [id, newTitle, newIsi];
}
