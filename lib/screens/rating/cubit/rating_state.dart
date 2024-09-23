part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}
final class ChnagingValueState extends RatingState {
  final String category;

  ChnagingValueState({required this.category });
}
final class LoadingState extends RatingState {}
final class SuccessState extends RatingState {}
final class ErrorState extends RatingState {
  final String msg;

  ErrorState({required this.msg});
}
