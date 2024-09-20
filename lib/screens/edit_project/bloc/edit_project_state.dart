part of 'edit_project_bloc.dart';

@immutable
sealed class EditProjectState {}

final class EditProjectInitial extends EditProjectState {}

final class EditImagesState extends EditProjectState {}

final class AddMemberState extends EditProjectState {}

final class DeleteMemberState extends EditProjectState {}

final class EditFileState extends EditProjectState {}
