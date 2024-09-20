part of 'edit_project_bloc.dart';

@immutable
sealed class EditProjectEvent {}

final class EditImagesEvent extends EditProjectEvent {
  final List imgs;
  EditImagesEvent({required this.imgs});
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

