part of 'profole_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final Profile profile;

  const ProfileLoadedState({required this.profile});

  @override
  List<Object> get props => [profile];
}

class ProfileErrorState extends ProfileState {
  final String error;

  const ProfileErrorState({required this.error});

  @override
  List<Object> get props => [error];
}