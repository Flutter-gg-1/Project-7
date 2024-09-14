import 'package:flutter/material.dart';

import 'custom_slider.dart';

class CustomEvaluationSlider extends StatelessWidget {
  final String label;
  final int index;
  const CustomEvaluationSlider(
      {super.key, required this.label, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 27,
                width: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff4129B7)),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            const SizedBox(
              width: 20,
            ),
            CustomSlider(
              index: index,
            ),
          ],
        ),
      ],
    );
  }
}
