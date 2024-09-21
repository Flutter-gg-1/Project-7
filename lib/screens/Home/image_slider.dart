import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management_app/screens/Home/cubit/image_slider_cubit_cubit.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/Group 44.png',
      'assets/Group 114.png',
      'assets/Screenshot 1446-03-17 at 12.00.00 AM 1.png',
    ];

    return BlocProvider(
      create: (context) => ImageSliderCubit(images.length)..startAutoSlide(),
      child: BlocBuilder<ImageSliderCubit, ImageSliderCubitState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 400,
                height: 180,
                child: PageView.builder(
                  controller: context
                      .read<ImageSliderCubit>()
                      .pageController, // استخدم نفس الـ PageController
                  onPageChanged: (index) {
                    context
                        .read<ImageSliderCubit>()
                        .updateIndex(index); // تحديث الفهرس عند التمرير اليدوي
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                          width: 400,
                          height: 200,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 45,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BlocBuilder<ImageSliderCubit, ImageSliderCubitState>(
                      builder: (context, state) {
                        int currentImage = 0;
                        if (state is ImageSliderCubitUpdated) {
                          currentImage = state.index;
                        }

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(images.length, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: currentImage == index ? 10 : 8,
                              height: currentImage == index ? 10 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentImage == index
                                    ? Colors.white
                                    : Colors.grey,
                                border:
                                    Border.all(color: Colors.grey, width: 1.5),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
