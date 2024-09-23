part of 'add_project_cubit.dart';

@immutable
sealed class AddProjectState {}

final class AddProjectInitial extends AddProjectState {}

final class StepperState extends AddProjectState {
  final int indexStep;
  StepperState({this.indexStep = 0});
}

final class UpdateState extends AddProjectState {

}


final class LoadingState extends AddProjectState {}

final class SuccessState extends AddProjectState {}

final class ErrorState extends AddProjectState {
  final String msg;
  ErrorState({required this.msg});
}
