part of 'edit_bloc.dart';

@immutable
sealed class EditEvent {}

class LogoImageChangeEvent extends EditEvent {
  final File selectedImage;
  LogoImageChangeEvent({required this.selectedImage});
}

class ProjectImagesChangeEvent extends EditEvent {
  final List<File> selectedImages;
  ProjectImagesChangeEvent({required this.selectedImages});
}

class ChangeLogoEvent extends EditEvent {}

class ChangeImagesEvent extends EditEvent {}

class ChangeBaseEvent extends EditEvent {}

class FilePickedEvent extends EditEvent {
  final File selectedFile;
  FilePickedEvent({required this.selectedFile});
}

class ChangePresentationEvent extends EditEvent {}

class ChangeLinksEvent extends EditEvent {}




class AddMembersEvent extends EditEvent {}


class ChangeMembersEvent extends EditEvent {

  //  final List<String> names;
  // final List<String> position;

  // ChangeMembersEvent({required this.names, required this.position});
}



