import 'package:flutter/material.dart';
import 'package:notes/views/widgets/note_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 1,
      itemBuilder: (context, index) => const NoteTile(),
    );
  }
}
