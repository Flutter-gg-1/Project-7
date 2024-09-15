part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class SuccessImageChangeState extends ProjectState {
  final File selectedImage;

  SuccessImageChangeState({required this.selectedImage});
}
