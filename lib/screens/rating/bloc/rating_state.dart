part of 'rating_bloc.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class SucsessState extends RatingState {}

final class ErrorState extends RatingState {}
