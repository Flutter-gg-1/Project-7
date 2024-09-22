part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ShowProfileState extends ProfileState {
  final ProfileModel profileModel;

  ShowProfileState({required this.profileModel});
}

final class ErorrState extends ProfileState {
  final String msg;

  ErorrState({required this.msg});
}

final class ArabicState extends ProfileState {
  final bool isArabic;

  ArabicState({required this.isArabic});
}
