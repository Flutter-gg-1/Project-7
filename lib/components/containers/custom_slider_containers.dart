import 'package:flutter/material.dart';

class CustomSliderContainers extends StatelessWidget {
  const CustomSliderContainers({super.key, required this.image});
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 205,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff4E2EB5),
                  ),
                  child: image,
                );
  }
}