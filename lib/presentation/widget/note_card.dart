import 'package:flutter/material.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/presentation/pages/detail_pages.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.ROUTE_NAME,
          arguments: note.id,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0,
        color: Colors.black26,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (note.title!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    note.title!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              if (note.isi!.isNotEmpty && note.title!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(note.isi!),
                ),
              if (note.title!.isEmpty && note.isi!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    note.isi!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
