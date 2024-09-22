part of 'admin_page_cubit.dart';

sealed class AdminPageState extends Equatable {
  const AdminPageState();

  @override
  List<Object> get props => [];
}

final class AdminPageInitial extends AdminPageState {}

class AdminPageLoading extends AdminPageState {}

class AdminPageLoaded extends AdminPageState {
  final List<ProjectModel> projects;
  const AdminPageLoaded({required this.projects});
}

class AdminPageError extends AdminPageState {
  final String message;
  const AdminPageError({required this.message});
}
