part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginFailed extends AuthState {
  final String error;

  LoginFailed({required this.error});
}

class LoginSuccess extends AuthState {
  final String success;

  LoginSuccess({required this.success});
}

class ErrorState extends AuthState {
  final String error;

  ErrorState({required this.error});
}

class AuthLoading extends AuthState {}
