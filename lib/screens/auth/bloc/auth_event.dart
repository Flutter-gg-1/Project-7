part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class LanguageChangeEvent extends AuthEvent{}

class CreateAccountEvent extends AuthEvent{}
