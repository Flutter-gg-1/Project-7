part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LoadingState extends ProfileState {}

final class GetProfileDatastate extends ProfileState {
  final String firstName;
  final String lastName;
  final String github;
  final String linkedin;
  final String email;
  final String cv;

  GetProfileDatastate({required this.firstName, required this.lastName, required this.github, required this.linkedin, required this.email, required this.cv});
}

final class SuccessState extends ProfileState {}

final class ErrorState extends ProfileState {
  final String msg;
  ErrorState({required this.msg});
}
