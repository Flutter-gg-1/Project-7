import 'package:flutter/material.dart';
import 'package:project_judge/services/extension/size_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.textcolor,
      this.onPressed,
      this.minimumSize});
  final Color backgroundColor;
  final String text;
  final Color textcolor;
  final Function()? onPressed;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
          width: context.getWidth(),
          height: 63,
          child: Center(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  minimumSize: minimumSize,
                  maximumSize: minimumSize,
                  backgroundColor: backgroundColor,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                text,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          )),
    );
  }
}
