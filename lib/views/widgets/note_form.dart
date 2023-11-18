import 'package:flutter/material.dart';

import 'main_text_form_field.dart';

class NoteForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const NoteForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MainTextFormField(
            label: 'Title',
            onSaved: (value) {
              titleController.text = value ?? '';
            },
          ),
          const SizedBox(height: 16),
          MainTextFormField(
            label: 'Content',
            maxLines: 5,
            onSaved: (value) {
              descriptionController.text = value ?? '';
            },
          ),
        ],
      ),
    );
  }
}
