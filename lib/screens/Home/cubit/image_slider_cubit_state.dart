part of 'image_slider_cubit_cubit.dart';

sealed class ImageSliderCubitState {}

final class ImageSliderCubitInitial extends ImageSliderCubitState {
  final int index; // أضف فهرس

  ImageSliderCubitInitial(this.index);
}

final class ImageSliderCubitUpdated extends ImageSliderCubitState {
  final int index; // أضف فهرس

  ImageSliderCubitUpdated(this.index);
}
