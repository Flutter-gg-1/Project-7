import 'package:flutter/material.dart';

import '../../components/text/custom_text.dart';

class EditProjectScreen extends StatelessWidget {
  const EditProjectScreen({super.key, this.onPressed, this.onCancelPressed});

  final Function()? onPressed;
  final Function()? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
              text: "Next",
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
    );
  }
}
