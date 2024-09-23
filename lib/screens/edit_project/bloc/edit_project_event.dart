part of 'edit_project_bloc.dart';

@immutable
sealed class EditProjectEvent {}

final class EditImagesEvent extends EditProjectEvent {
  final List imgs;
  EditImagesEvent({required this.imgs});
}

final class UpdateLogoEvent extends EditProjectEvent {
    final File logo;
    UpdateLogoEvent({required this.logo});
}

final class UpdatePresentationDateEvent extends EditProjectEvent {
    final DateTime date;
    UpdatePresentationDateEvent({required this.date});
}

final class UpdateProjectDurationEvent extends EditProjectEvent {
    final DateTimeRange date;
    UpdateProjectDurationEvent({required this.date});
}


final class DeleteImagesEvent extends EditProjectEvent {
  final int imgsInt;
  DeleteImagesEvent({required this.imgsInt});

}

class UpdateMembersEvent extends EditProjectEvent {
  final int index;
  final String id;
  final String role;

  UpdateMembersEvent({required this.index, required this.id, required this.role});
}


class UpdateLinksEvent extends EditProjectEvent {

  final String? github;
  final String? figma;
  final String? video;
  final String? pinterest;
  final String? playstore;
  final String? applestore;
    final String? apk;
  final String? web;


  UpdateLinksEvent({this.figma, this.video, this.pinterest, this.playstore, this.applestore, this.apk, this.web, this.github});
}

class UpdateFileEvent extends EditProjectEvent {
  final File presentation;

  UpdateFileEvent({required this.presentation});
}

class DeleteMembersEvent extends EditProjectEvent {
  final int index;

  DeleteMembersEvent({required this.index});
}


final class AddMembersEvent extends EditProjectEvent {
}

