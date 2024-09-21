part of 'show_projects_cubit.dart';

@immutable
sealed class ShowProjectsState {}

final class ShowProjectsInitial extends ShowProjectsState {}

final class ShowAllProjectState extends ShowProjectsState {
  final List<ProjectsModel> projectList;

  ShowAllProjectState({required this.projectList});
}

final class ErorrProjectState extends ShowProjectsState {
  final String msg;

  ErorrProjectState({required this.msg});
}

final class LodingProjectState extends ShowProjectsState {}
