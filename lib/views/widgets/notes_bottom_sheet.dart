import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/add_note/add_note_cubit.dart';
import 'main_elevated_button.dart';
import 'note_form.dart';

class NotesBottomSheet extends StatefulWidget {
  const NotesBottomSheet({super.key});

  @override
  State<NotesBottomSheet> createState() => _NotesBottomSheetState();
}

class _NotesBottomSheetState extends State<NotesBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            NoteForm(
              formKey: formKey,
              titleController: titleController,
              descriptionController: descriptionController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: BlocProvider(
                create: (context) => AddNoteCubit(),
                child: BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                    switch (state.addNoteStatus) {
                      case AddNoteStatus.success:
                        Navigator.pop(context);
                      case AddNoteStatus.failure:
                        debugPrint(state.message);
                      default:
                    }
                  },
                  builder: (context, state) {
                    return MainElevatedButton(
                      label: 'Add',
                      isLoading: state.addNoteStatus == AddNoteStatus.loading,
                      onPressed: () {
                        if (isFormValid) submit();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
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
