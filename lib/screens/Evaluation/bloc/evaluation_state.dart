part of 'evaluation_bloc.dart';

sealed class EvaluationState {}

class EvaluationInitial extends EvaluationState {
  final List<double> sliderValues;
  final String comment;

  EvaluationInitial()
      : sliderValues = List.generate(6, (index) => 0.0),
        comment = '';
}

class EvaluationUpdatedState extends EvaluationState {
  final List<double> sliderValues;
  final String comment;

  EvaluationUpdatedState({
    required this.sliderValues,
    required this.comment,
  });
}

class EvaluationSuccessfulState extends EvaluationState {
  final List<double> sliderValues;
  final String comment;

  EvaluationSuccessfulState({
    required this.sliderValues,
    required this.comment,
  });
}