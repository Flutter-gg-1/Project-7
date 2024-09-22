import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/models/profile_model.dart';

class CarouselSliderCustome extends StatelessWidget {
  const CarouselSliderCustome({
    super.key,
    required this.currentIndex,
    required this.onPageChanged,
    required this.carouselSliderWidget,
  });
  final int currentIndex;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  final List<ImagesProject> carouselSliderWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(multiply: 0.4),
      width: context.getWidth(multiply: 0.8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: context.getHeight(multiply: 0.4),
              viewportFraction: 1,
              onPageChanged: onPageChanged,
            ),
            items: carouselSliderWidget.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        i.url,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              "assets/image/Search-amico(1).png");
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return const Center(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
          ),
          Positioned(
            top: context.getWidth(multiply: 0.03),
            left: context.getWidth(multiply: 0.35),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff9C9C9C).withOpacity(0.55),
                borderRadius: BorderRadius.circular(25),
              ),
              child: AnimatedSmoothIndicator(
                effect: const CustomizableEffect(
                  dotDecoration: DotDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  activeDotDecoration: DotDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                activeIndex: currentIndex,
                count: carouselSliderWidget.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
