import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/injection.dart' as di;
import 'package:my_notes_app/presentation/bloc/add_note_page_bloc/add_note_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/detail_page_bloc/detail_page_bloc.dart';
import 'package:my_notes_app/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:my_notes_app/presentation/pages/add_notes_pages.dart';
import 'package:my_notes_app/presentation/pages/detail_pages.dart';
import 'package:my_notes_app/presentation/pages/home_pages.dart';
import 'package:my_notes_app/utils/route_observer.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider(create: (_) => di.locator<HomePageBloc>()),
          BlocProvider(create: (_) => di.locator<DetailPageBloc>()),
          BlocProvider(create: (_) => di.locator<AddNotePageBloc>())
        ],
        child: MaterialApp(
          title: 'My Notes App',
          theme: ThemeData.dark(useMaterial3: true),
          home: HomePage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(builder: (_) => HomePage());
              case AddNotesPages.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => AddNotesPages());
              case DetailPage.ROUTE_NAME:
                final id = settings.arguments as int;
                return MaterialPageRoute(
                  builder: (_) => DetailPage(id: id),
                  settings: settings,
                );
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          },
        ));
  }
}
