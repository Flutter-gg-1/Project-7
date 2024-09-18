import 'package:flutter/material.dart';

import '../../components/text/custom_text.dart';

class ReviewProjectScreen extends StatelessWidget {
  const ReviewProjectScreen({super.key, this.onPressed, this.onCancelPressed});
  final Function()? onPressed;
  final Function()? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const CustomText(text: "Project name", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 10),
        const CustomText(text: "Bootcamp name", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 10),
        const CustomText(text: "Type", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 10),
        const CustomText(text: "Start time", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 10),
        const CustomText(text: "End time", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 10),
        const CustomText(text: "Presentation date", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 10),
        const CustomText(text: "Team lead", size: 16),
        const SizedBox(height: 10),
        const CustomText(
          text: "Lorem ipsum",
          size: 12,
          color: Color(0xff848484),
        ),
        const SizedBox(height: 40),
        Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(385, 63),
                backgroundColor: const Color(0xff4D2EB4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const CustomText(
                text: "Done",
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: onCancelPressed,
              child: const CustomText(
                text: "Cancel",
                size: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
