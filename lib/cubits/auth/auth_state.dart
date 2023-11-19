part of 'auth_cubit.dart';

enum AuthStatus {
  unAuthenticated,
  loading,
  failure,
  authenticated,
}

class AuthState {
  final AuthStatus authStatus;
  final String message;
  final UserCredential? userCredential;

  AuthState({
    required this.authStatus,
    required this.message,
    required this.userCredential,
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    String? message,
    UserCredential? userCredential,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      message: message ?? this.message,
      userCredential: userCredential ?? this.userCredential,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      authStatus: AuthStatus.unAuthenticated,
      message: '',
      userCredential: null,
    );
  }

  @override
  String toString() =>
      'AuthState(authStatus: $authStatus, message: $message, userCredential: $userCredential)';
}
