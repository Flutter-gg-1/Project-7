part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class SucsessState extends ProjectState {
  final String msg;

  SucsessState({required this.msg});
}

class EditChangeState extends ProjectState {
  final bool isEdit;
  EditChangeState({required this.isEdit});
}

final class ErrorState extends ProjectState {
  final String msg;

  ErrorState({required this.msg});
}

final class ProjectImagesState extends ProjectState {
  final File? profileImage;
  final File? logoImage;
  final File? projectImage;
  final File? presentationImage;

  ProjectImagesState({
    this.profileImage,
    this.logoImage,
    this.projectImage,
    this.presentationImage,
  });
}
