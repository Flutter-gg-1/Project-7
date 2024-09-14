part of 'load_cubit.dart';

@immutable
sealed class LoadTokenState {}

final class LoadTokenInitial extends LoadTokenState {}

final class LoggedInUserState extends LoadTokenState {}

final class LoggedOutUserState extends LoadTokenState {}
