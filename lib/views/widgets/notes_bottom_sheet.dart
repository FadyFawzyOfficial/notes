import 'package:flutter/material.dart';

import 'main_elevated_button.dart';
import 'main_text_form_field.dart';

class NotesBottomSheet extends StatelessWidget {
  const NotesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: MainElevatedButton(
                label: 'Add',
                isLoading: false,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
