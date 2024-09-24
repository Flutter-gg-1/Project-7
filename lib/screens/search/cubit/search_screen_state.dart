part of 'search_screen_cubit.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitial extends SearchScreenState {}

final class SearchScreenShowFoundState extends SearchScreenState {
  final List<ProjectsModel> projectsLis;

  SearchScreenShowFoundState({required this.projectsLis});
}

final class SearchScreenNotFoundState extends SearchScreenState {}

final class SearchScreenLodingState extends SearchScreenState {}

final class SearchScreenErorrState extends SearchScreenState {
  final String msg;

  SearchScreenErorrState({required this.msg});
}
