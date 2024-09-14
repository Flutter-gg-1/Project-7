import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentImage = 0;
  final List<String> images = [
    'assets/Group 44.png',
    'assets/Group 44.png',
    'assets/Group 44.png',
  ];

  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentImage);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentImage < images.length - 1) {
        _currentImage++;
      } else {
        _currentImage = 0;
      }
      _pageController.animateToPage(
        _currentImage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 400,
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (int index) {
              setState(() {
                _currentImage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                    width: 343,
                    height: 180,
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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(images.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentImage == index ? 10 : 8,
                    height: _currentImage == index ? 10 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentImage == index ? Colors.white : Colors.grey,
                      border: Border.all(color: Colors.grey, width: 1.5),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
