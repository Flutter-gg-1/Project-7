import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.textAlign,
       this.size,
       this.color,
      this.weight,
      this.allowOverflow = false});
  final String text;
  final TextAlign? textAlign;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final bool allowOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
      overflow:
          allowOverflow == true ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }
}
