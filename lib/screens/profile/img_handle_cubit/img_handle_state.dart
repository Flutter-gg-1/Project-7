part of 'img_handle_cubit.dart';

@immutable
sealed class ImgHandleState {}

final class ImgHandleInitial extends ImgHandleState {}

final class ImageHereState extends ImgHandleState {
  final List<int> imgFile;
  final String? imagUrl;

  ImageHereState({this.imagUrl, required this.imgFile});
}

final class ImageNoState extends ImgHandleState {
  ImageNoState();
}
