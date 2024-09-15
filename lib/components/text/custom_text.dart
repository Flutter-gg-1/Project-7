import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.textAlign, required this.size, required this.color, this.fontWeight});
  final String text;
  final TextAlign? textAlign;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;


  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign:textAlign , style: TextStyle( fontSize: size,color: color,fontWeight: weight,),);
  }
}
