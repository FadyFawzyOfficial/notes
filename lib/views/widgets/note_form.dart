import 'package:flutter/material.dart';

import 'colors_list_view.dart';
import 'main_text_form_field.dart';

class NoteForm extends StatelessWidget {
  final String title;
  final String description;
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const NoteForm({
    super.key,
    this.title = '',
    this.description = '',
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
            initialValue: title,
            onSaved: (value) {
              titleController.text = value ?? '';
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: MainTextFormField(
              maxLines: 5,
              label: 'Content',
              initialValue: description,
              onSaved: (value) {
                descriptionController.text = value ?? '';
              },
            ),
          ),
          const ColorsListView(),
        ],
      ),
    );
  }
}
