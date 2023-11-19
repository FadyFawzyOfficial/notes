import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilities/snack_bar_shower.dart';
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
                'Sign Up',
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
                label: 'Sign Up',
                isLoading: isLoading,
                onPressed: () async {
                  try {
                    setState(() => isLoading = true);
                    if (isFormValid) await signUp();
                    showSnackBar(context, 'Success');
                  } on FirebaseAuthException catch (e) {
                    showSnackBar(context, e.message);
                  }
                  setState(() => isLoading = false);
                },
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

  Future<void> signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
