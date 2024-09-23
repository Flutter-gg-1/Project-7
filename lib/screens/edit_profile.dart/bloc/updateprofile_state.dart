part of 'updateprofile_bloc.dart';

@immutable
sealed class UpdateprofileState {}

final class UpdateprofileInitial extends UpdateprofileState {}

final class UpdatedState extends UpdateprofileState {}

final class LoadingState extends UpdateprofileState {}

final class SuccessState extends UpdateprofileState {}

final class ErrorState extends UpdateprofileState {
  final String msg;
  ErrorState({required this.msg});
}
