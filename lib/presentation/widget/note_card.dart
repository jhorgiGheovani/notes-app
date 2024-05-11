import 'package:flutter/material.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/presentation/pages/detail_pages.dart';
import 'package:my_notes_app/utils/helper_function.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(
        note.tanggal ?? ""); // Convert timestamp string to DateTime object
    int timestamp =
        date.millisecondsSinceEpoch ~/ 1000; // Get timestamp in seconds

    // print(readTimestamp(timestamp)); // Print the time difference
    String timeDifference = readTimestamp(timestamp);
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
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        color: Colors.black87,
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (note.title!.isNotEmpty)
                    Text(
                      note.title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (note.isi!.isNotEmpty && note.title!.isNotEmpty)
                    Text(
                      note.isi!,
                      style: const TextStyle(fontSize: 15),
                    ),
                  if (note.title!.isEmpty && note.isi!.isNotEmpty)
                    Text(
                      note.isi!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.alarm,
                          size: 15,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          timeDifference,
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
