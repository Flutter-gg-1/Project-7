part of 'profile_screen_cubit.dart';

@immutable
sealed class ProfileScreenState {}

final class ProfileScreenInitial extends ProfileScreenState {}

class ImageSelected extends ProfileScreenState {
  final File image;

  ImageSelected(this.image);
}
