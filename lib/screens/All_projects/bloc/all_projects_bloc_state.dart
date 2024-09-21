part of 'all_projects_bloc_bloc.dart';

abstract class AllProjectsState extends Equatable {
  const AllProjectsState();
  @override
  List<Object> get props => [];
}

class AllProjectsInitial extends AllProjectsState {}

class AllProjectsLoading extends AllProjectsState {}

class AllProjectsLoaded extends AllProjectsState {
  final List<ProjectModel> projects;
  const AllProjectsLoaded(this.projects);
}

class AllProjectsError extends AllProjectsState {
  final String message;
  const AllProjectsError(this.message);
}