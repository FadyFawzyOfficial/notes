import 'package:flutter/material.dart';

import 'widgets/main_elevated_button.dart';
import 'widgets/main_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';
  var isLoading = false;

  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    // Image.asset(kLogo),
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 24),
              MainTextFormField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value ?? '',
              ),
              const SizedBox(height: 16),
              MainTextFormField(
                label: 'Password',
                obscureText: true,
                onSaved: (value) => password = value ?? '',
              ),
              const SizedBox(height: 24),
              MainElevatedButton(
                label: 'Sign Up',
                isLoading: isLoading,
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isFormValid {
    var form = _formKey.currentState;
    if (form == null || !form.validate()) return false;

    form.save();
    return true;
  }
}
