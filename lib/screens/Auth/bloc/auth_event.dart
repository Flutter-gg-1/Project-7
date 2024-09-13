part of 'auth_bloc.dart';

@immutable
sealed class CreateAccountEvent {}

class CreateEvent extends CreateAccountEvent {}
