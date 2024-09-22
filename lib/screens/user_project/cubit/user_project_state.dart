part of 'user_project_cubit.dart';

@immutable
sealed class UserProjectState {}

final class UserProjectInitial extends UserProjectState {}

final class UserProjectShowState extends UserProjectState {
  final List<ProjectsModel> projectList;

  UserProjectShowState({required this.projectList});
}

final class UserProjectSLoadingState extends UserProjectState {}

final class UserProjectErrState extends UserProjectState {
  final String msg;

  UserProjectErrState({required this.msg});
}
