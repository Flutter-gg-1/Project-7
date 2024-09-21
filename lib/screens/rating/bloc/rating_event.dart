part of 'rating_bloc.dart';

@immutable
sealed class RatingEvent {}

class CompleteRatingEvent extends RatingEvent {
  final String projectId;

  CompleteRatingEvent({required this.projectId});
}
