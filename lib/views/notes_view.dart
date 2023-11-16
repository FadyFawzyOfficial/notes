import 'package:flutter/material.dart';

import 'widgets/search_button.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Notes'),
        actions: const [
          SearchButton(),
        ],
      ),
    );
  }
}
