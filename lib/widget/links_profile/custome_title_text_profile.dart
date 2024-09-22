import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeTitleText extends StatelessWidget {
  const CustomeTitleText({
    super.key,
    required this.title,
    required this.isArabic,
  });

  final String title;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        children: [
          SizedBox(
            width: context.getWidth(multiply: 0.055),
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Color(0xff181D27)),
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          )
        ],
      ),
    );
  }
}
