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
  final String email;

  AuthState({
    required this.authStatus,
    required this.message,
    required this.email,
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    String? message,
    String? email,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      message: message ?? this.message,
      email: email ?? this.email,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      authStatus: AuthStatus.unAuthenticated,
      message: '',
      email: '',
    );
  }

  @override
  String toString() =>
      'AuthState(authStatus: $authStatus, message: $message, email: $email)';
}
