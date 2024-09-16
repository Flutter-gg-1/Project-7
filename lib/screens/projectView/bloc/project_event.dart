part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class ProfileImageChangeEvent extends ProjectEvent {
  final File selectedImage;
  ProfileImageChangeEvent({required this.selectedImage});
}

class LogoImageChangeEvent extends ProjectEvent {
  final File selectedImage;
  LogoImageChangeEvent({required this.selectedImage});
}

class ProjectImageChangeEvent extends ProjectEvent {
  final File selectedImage;
  ProjectImageChangeEvent({required this.selectedImage});
}

class PresentationImageChangeEvent extends ProjectEvent {
  final File selectedImage;
  PresentationImageChangeEvent({required this.selectedImage});
}

class IsEditEvent extends ProjectEvent {
  final bool isEdit;

  IsEditEvent({required this.isEdit});
}

class CreateProjectEvent extends ProjectEvent {}
