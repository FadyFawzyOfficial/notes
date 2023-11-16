import 'package:flutter/material.dart';

import 'views/notes_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: const NotesView(),
    );
  }
}
