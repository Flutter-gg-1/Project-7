import 'package:flutter/material.dart';
import 'package:project_judge/services/extension/size_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.textcolor,
      this.onPressed});
  final Color backgroundColor;
  final String text;
  final Color textcolor;
  final Function()? onPressed;

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
                  minimumSize: const Size(420, 63),
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
