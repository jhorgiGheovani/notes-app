import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/domain/entities/note.dart';
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_event.dart';
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_state.dart';
import 'package:my_notes_app/utils/helper_function.dart';

class AddNotesPages extends StatefulWidget {
  static const String ROUTE_NAME = "/add_notes_page";

  @override
  State<AddNotesPages> createState() => _AddNotesPagesState();
}

class _AddNotesPagesState extends State<AddNotesPages> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  bool isButtonEnabled = false;
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  void updateButtonState() {
    setState(() {
      // Enable button only if both fields are not empty
      isButtonEnabled =
          titleController.text.isNotEmpty || descController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(updateButtonState);
    descController.addListener(updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        //BlockBuilder
        BlocBuilder<AddNotePageBloc, AddNotePageState>(
          builder: (context, homepagestate) {
            if (homepagestate is AddNotePageSuccessState) {
              // final scaffoldMessenger = ScaffoldMessenger.of(context);
              // scaffoldMessenger.showSnackBar(SnackBar(
              //   content: Text(homepagestate.message),
              // ));
              // Navigator.pop(context);

              return Container();
            } else if (homepagestate is AddNotePageFailedState) {
              // final scaffoldMessenger = ScaffoldMessenger.of(context);
              // scaffoldMessenger.showSnackBar(SnackBar(
              //   content: Text(homepagestate.message),
              // ));
              return Container();
            } else {
              return Container();
            }
          },
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: isButtonEnabled
                      ? () {
                          //context read
                          context.read<AddNotePageBloc>().add(SavedNote(Note(
                              id: 1,
                              title: titleController.text,
                              isi: descController.text,
                              tanggal: getCurrentTimeStamp())));
                          Navigator.pop(context);
                        }
                      : null,
                  child: Icon(Icons.check,
                      color: isButtonEnabled ? null : Colors.grey),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: "Title",
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            controller: descController,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
        )
      ],
    )));
  }
}
