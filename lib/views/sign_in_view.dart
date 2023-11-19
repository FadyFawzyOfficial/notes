import 'package:flutter/material.dart';

import '../constants/strings.dart';
import 'widgets/main_elevated_button.dart';
import 'widgets/main_text_form_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';
  var isLoading = false;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes App')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 24),
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
                label: 'Sign In',
                isLoading: isLoading,
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, kSignUpView),
                    child: const Text('Sign Up'),
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
