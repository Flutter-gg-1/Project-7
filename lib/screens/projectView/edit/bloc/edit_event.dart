part of 'edit_bloc.dart';

@immutable
sealed class EditEvent {}

class LogoImageChangeEvent extends EditEvent {
  final File selectedImage;
  LogoImageChangeEvent({required this.selectedImage});
}

class ProjectImageChangeEvent extends EditEvent {
  final File selectedImage;
  ProjectImageChangeEvent({required this.selectedImage});
}

class PresentationImageChangeEvent extends EditEvent {
  final File selectedImage;
  PresentationImageChangeEvent({required this.selectedImage});
}

class ChangeLogoEvent extends EditEvent {}

class ChangeBaseEvent extends EditEvent {}
