part of 'add_project_cubit.dart';

@immutable
sealed class AddProjectState {}

final class AddProjectInitial extends AddProjectState {}

final class StepperState extends AddProjectState {
  final int indexStep;
  final DateTime? presentationDate;
  StepperState({this.indexStep = 0, this.presentationDate});
}

