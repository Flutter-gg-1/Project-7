part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LanguageChangeEvent extends AuthEvent {}

class CreateAccountEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}

class VerfieyEvent extends AuthEvent {
  final String email;

  VerfieyEvent({required this.email});
}
