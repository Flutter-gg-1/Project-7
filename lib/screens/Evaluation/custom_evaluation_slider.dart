import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';

import 'custom_slider.dart';

class CustomEvaluationSlider extends StatelessWidget {
  final String label;
  final int index;
  final ValueChanged<double> onChanged; // Add this line

  const CustomEvaluationSlider({
    super.key,
    required this.label,
    required this.index,
    required this.onChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                height: 27,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.blueDark),
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
              onChanged: onChanged, // Pass the onChanged callback
            ),
          ],
        ),
      ],
    );
  }
}
