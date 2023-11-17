import 'package:flutter/material.dart';

import 'main_text_form_field.dart';

class NotesBottomSheet extends StatelessWidget {
  const NotesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          MainTextFormField(
            label: 'Title',
            onSaved: (value) {},
          ),
          const SizedBox(height: 16),
          MainTextFormField(
            label: 'Content',
            maxLines: 5,
            onSaved: (value) {},
          )
        ],
      ),
    );
  }
}
