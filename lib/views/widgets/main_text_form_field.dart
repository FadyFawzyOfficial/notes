import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  final String label;
  final Function(String?)? onSaved;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValue;

  const MainTextFormField({
    super.key,
    required this.label,
    required this.onSaved,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.initialValue,
  });

  @override
  Widget build(context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      initialValue: initialValue,
      validator: (value) =>
          value == null || value.isEmpty ? 'This field is required' : null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
