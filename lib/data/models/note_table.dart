import 'package:equatable/equatable.dart';
import 'package:my_notes_app/domain/entities/note.dart';

class NoteTable extends Equatable {
  final int id;
  final String? title;
  final String? isi;
  final String? tanggal;

  NoteTable(
      {required this.id,
      required this.title,
      required this.isi,
      required this.tanggal});

  Map<String, dynamic> toJson() =>
      {'title': title, 'isi': isi, 'tanggal': tanggal};

  factory NoteTable.fromMap(Map<String, dynamic> map) => NoteTable(
      id: map['id'],
      title: map['title'],
      isi: map['isi'],
      tanggal: map['tanggal']);

  factory NoteTable.fromEntity(Note note) => NoteTable(
      id: note.id, title: note.title, isi: note.isi, tanggal: note.tanggal);

  Note toEntity() => Note(id: id, title: title, isi: isi, tanggal: tanggal);

  @override
  List<Object?> get props => [id, title, isi, tanggal];
}
