part of 'loading_screen_cubit.dart';

@immutable
sealed class LoadingScreenState {}

final class LoadingScreenInitial extends LoadingScreenState {}
final class LoadingState extends LoadingScreenState {}
final class LoggedInState extends LoadingScreenState {}
final class NotLoggedInState extends LoadingScreenState {}
