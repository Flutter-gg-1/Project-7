import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.textcolor,
    required this.onPressed,
    this.minimumSize,
  });

  final Color backgroundColor;
  final String text;
  final Color textcolor;
  final Function()? onPressed;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: backgroundColor,
        fixedSize: minimumSize ?? Size(MediaQuery.of(context).size.width, 63),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: 20),
        ),
      ),
    );
  }
}
