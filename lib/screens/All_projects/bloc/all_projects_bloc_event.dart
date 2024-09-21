part of 'all_projects_bloc_bloc.dart';

abstract class AllProjectsEvent extends Equatable {
  const AllProjectsEvent();
  @override
  List<Object> get props => [];
}

class FetchAllProjectsEvent extends AllProjectsEvent {}
