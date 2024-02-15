part of 'auth_bloc.dart';

class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({
    required this.email,
    required this.password,
  });
}

final class AuthLogoutRequest extends AuthEvent {}
