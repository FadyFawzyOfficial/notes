import 'package:flutter/material.dart';

import 'widgets/app_bar_button.dart';
import 'widgets/note_form.dart';

class EditNoteView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          AppBarButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              if (isFormValid) submit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: NoteForm(
          formKey: formKey,
          titleController: titleController,
          descriptionController: descriptionController,
        ),
      ),
    );
  }

  bool get isFormValid {
    var form = formKey.currentState;
    if (form == null || !form.validate()) return false;

    form.save();
    return true;
  }

  void submit() {
    debugPrint(titleController.text);
    debugPrint(descriptionController.text);
  }
}
