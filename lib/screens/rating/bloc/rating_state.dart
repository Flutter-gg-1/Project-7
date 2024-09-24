part of 'rating_bloc.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class LoadingState extends RatingState {}

final class SucsessState extends RatingState {
  final String msg;

  SucsessState({required this.msg});
}

final class ErrorState extends RatingState {
  final String msg;

  ErrorState({required this.msg});
}
