import 'package:flutter/material.dart';

import 'custom_slider.dart';

class CustomEvaluationSlider extends StatelessWidget {
  final String label;
  const CustomEvaluationSlider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
        const CustomSlider(),
      ],
    );
  }
}
