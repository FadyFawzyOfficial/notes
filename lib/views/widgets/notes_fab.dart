import 'package:flutter/material.dart';

import 'notes_bottom_sheet.dart';

class NotesFab extends StatelessWidget {
  const NotesFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          builder: (context) => const NotesBottomSheet(),
        );
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}
