import 'package:flutter/material.dart';

import 'widgets/home_fab.dart';
import 'widgets/notes_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: const NotesListView(),
      floatingActionButton: const HomeFab(),
    );
  }
}
