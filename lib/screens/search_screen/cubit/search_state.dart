part of 'search_cubit.dart';


@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {
    final List<Projects> filteredProjects;
  final List<Projects> allProjects;

    SearchInitial({required this.filteredProjects, required this.allProjects});

}




