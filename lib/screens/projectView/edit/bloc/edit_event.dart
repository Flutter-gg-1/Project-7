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

class ChangeLogoEvent extends EditEvent {}

class ChangeBaseEvent extends EditEvent {}

class FilePickedEvent extends EditEvent {
  final File selectedFile;
  FilePickedEvent({required this.selectedFile});
}

class ChangePresentationEvent extends EditEvent{}

class ChangeLinksEvent extends EditEvent{}