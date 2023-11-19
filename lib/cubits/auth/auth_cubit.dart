import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enum_values.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void signUp({required String email, required String password}) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(
        state.copyWith(
          authStatus: AuthStatus.authenticated,
          email: userCredential.user?.email,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          message: '$e',
        ),
      );
    }
  }

  void signIn({required String email, required String password}) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(
        state.copyWith(
          authStatus: AuthStatus.authenticated,
          email: userCredential.user?.email,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          message: '$e',
        ),
      );
    }
  }
}
