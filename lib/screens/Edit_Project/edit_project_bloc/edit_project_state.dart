part of 'edit_project_bloc.dart';

abstract class EditProjectState {}

class EditProjectInitial extends EditProjectState {}

class EditProjectLoading extends EditProjectState {}

class ProjectStatusUpdated extends EditProjectState {}

class BasicInfoSaved extends EditProjectState {}

class LinksSaved extends EditProjectState {}

class MembersSaved extends EditProjectState {}

class LogoUploaded extends EditProjectState {}

class PresentationUploaded extends EditProjectState {}

class ImagesUploaded extends EditProjectState {}

class EditProjectFailure extends EditProjectState {
  final String message;
  EditProjectFailure(this.message);
}
