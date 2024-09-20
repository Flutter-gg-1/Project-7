part of 'view_project_details_cubit.dart';

@immutable
sealed class ViewProjectDetailsState {}

final class ViewProjectDetailsInitial extends ViewProjectDetailsState {}

final class LoadingState extends ViewProjectDetailsState {}

final class SuccessState extends ViewProjectDetailsState {}

final class ErrorState extends ViewProjectDetailsState {
  final String msg;
  ErrorState({required this.msg});
}
