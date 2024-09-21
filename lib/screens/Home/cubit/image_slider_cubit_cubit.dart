import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ImageSliderCubit extends Cubit<ImageSliderCubitState> {
  final int imageCount;
  PageController pageController = PageController();
  Timer? _timer;

  ImageSliderCubit(this.imageCount) : super(ImageSliderCubitInitial());

  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextIndex = (pageController.page!.toInt() + 1) % imageCount;
      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      emit(ImageSliderCubitUpdated(nextIndex));
    });
  }

  void updateIndex(int index) {
    _timer?.cancel(); // إيقاف المؤقت عند التمرير اليدوي
    emit(ImageSliderCubitUpdated(index));
    startAutoSlide(); // إعادة تشغيل المؤقت بعد التمرير
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    pageController.dispose(); // تأكد من التخلص من الـ PageController
    return super.close();
  }
}

// الحالات
abstract class ImageSliderCubitState {}

class ImageSliderCubitInitial extends ImageSliderCubitState {}

class ImageSliderCubitUpdated extends ImageSliderCubitState {
  final int index;
  ImageSliderCubitUpdated(this.index);
}
