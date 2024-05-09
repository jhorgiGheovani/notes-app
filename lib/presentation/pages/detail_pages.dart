import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_event.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_state.dart';

class DetailPage extends StatefulWidget {
  static const String ROUTE_NAME = "/detail_page";
  final int id;

  const DetailPage({super.key, required this.id});
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailPageBloc>().add(GetDetailNoteEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailPageBloc, DetailPageState>(
            builder: (context, state) {
          if (state is DetailPageLoadedDataState) {
            TextEditingController titleController =
                TextEditingController(text: state.result.title ?? "");
            if (state.result.title == null || state.result.title!.isEmpty) {
              titleController.text =
                  ""; // Set text to empty if title is null or empty
            }

            TextEditingController isiController =
                TextEditingController(text: state.result.isi ?? "");
            if (state.result.isi == null || state.result.isi!.isEmpty) {
              isiController.text =
                  ""; // Set text to empty if title is null or empty
            }
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            //context read
                            context.read<DetailPageBloc>().add(
                                UpdateNoteContentEvent(widget.id,
                                    titleController.text, isiController.text));
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.check),
                        ),
                      ],
                    )),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                  ),
                ),
                TextField(
                  controller: isiController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ],
            );
          } else if (state is DetailPageFailedState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("can't load details!"));
          }
        }),
      ),
    );
  }
}
