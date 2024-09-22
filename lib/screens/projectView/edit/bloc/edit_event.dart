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

class IsEditEvent extends EditEvent {
  final bool isEdit;

  IsEditEvent({required this.isEdit});
}

class IsPublicEvent extends EditEvent {
  final bool isPublic;

  IsPublicEvent({required this.isPublic});
}

class AllowRatingEvent extends EditEvent {
  final bool allowRating;

  AllowRatingEvent({required this.allowRating});
}

class ChangeLogoEvent extends EditEvent {
  // final String projectId;

  // ChangeLogoEvent({required this.projectId});
}

class ChangeImagesEvent extends EditEvent {}

class ChangeBaseEvent extends EditEvent {}

class FilePickedEvent extends EditEvent {
  final File selectedFile;
  FilePickedEvent({required this.selectedFile});
}

class ChangePresentationEvent extends EditEvent {}

class ChangeLinksEvent extends EditEvent {}

class ChangeStatusEvent extends EditEvent {
  final String projectId;

  ChangeStatusEvent({required this.projectId});
}

class AddMembersEvent extends EditEvent {}

class ChangeMembersEvent extends EditEvent {
  //  final List<String> names;
  // final List<String> position;

  // ChangeMembersEvent({required this.names, required this.position});
}
