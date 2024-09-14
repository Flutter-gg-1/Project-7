import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_slider_cubit_state.dart';
class ImageSliderCubit extends Cubit<int> {
  ImageSliderCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }

  void autoSlide(int totalImages) {
    int nextIndex = state < totalImages - 1 ? state + 1 : 0;
    emit(nextIndex);
  }
}