part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

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
