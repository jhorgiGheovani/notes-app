import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final String? title;
  final String? isi;
  final String? tanggal;

  Note(
      {required this.id,
      required this.title,
      required this.isi,
      required this.tanggal});

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'isi': isi, 'tanggal': tanggal};

  factory Note.fromMap(Map<String, dynamic> map) => Note(
      id: map['id'],
      title: map['title'],
      isi: map['isi'],
      tanggal: map['tanggal']);
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, isi, tanggal];
}
