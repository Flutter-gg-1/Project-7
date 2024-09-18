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




final class ImageHereState extends ProfileState {
  final List<int> imgFile;

  ImageHereState({required this.imgFile});
}


final class ImageNoState extends ProfileState {
  

  ImageNoState();
}

