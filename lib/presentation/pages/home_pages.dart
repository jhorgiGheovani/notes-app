import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_event.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_state.dart';
import 'package:my_notes_app/presentation/pages/add_notes_pages.dart';
import 'package:my_notes_app/presentation/widget/note_card.dart';
import 'package:my_notes_app/utils/route_observer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(LoadNotesList());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<HomePageBloc>().add(LoadNotesList());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(LoadNotesList());
    return Scaffold(
      body: SafeArea(child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageEmptDataState) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Notes",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("0 Notes"),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Empty Notes"),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is HomePageLoadedDataState) {
            final result = state.result;
            return ListView.builder(
              itemCount: result.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "All Notes",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text("${result.length} Notes"),
                        ],
                      ));
                }
                int numberOfExtraWidget = 1;
                index = index - numberOfExtraWidget;
                final item = result[index];
                return NoteCard(item);
              },
            );
          } else if (state is HomePageFailedState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.white, size: 45),
          onPressed: () =>
              {Navigator.pushNamed(context, AddNotesPages.ROUTE_NAME)}),
    );
  }
}
