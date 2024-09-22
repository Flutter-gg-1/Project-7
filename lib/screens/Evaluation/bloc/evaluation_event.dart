part of 'evaluation_bloc.dart';

sealed class EvaluationEvent {}

final class UpdateSliderValue extends EvaluationEvent {
  final int index;
  final double value;

  UpdateSliderValue({required this.index, required this.value});
}

final class UpdateComment extends EvaluationEvent {
  final String comment;

  UpdateComment({required this.comment});
}

class SendRatingEvent extends EvaluationEvent {
  final String token;
  final String projectId;

  SendRatingEvent({required this.token, required this.projectId});
}
