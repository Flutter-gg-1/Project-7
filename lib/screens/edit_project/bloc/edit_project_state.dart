part of 'edit_project_bloc.dart';

@immutable
sealed class EditProjectState {}

final class EditProjectInitial extends EditProjectState {}

final class UpdateProjectEntryState extends EditProjectState {}