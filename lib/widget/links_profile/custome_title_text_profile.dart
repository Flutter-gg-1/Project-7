import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeTitleText extends StatelessWidget {
  const CustomeTitleText({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          SizedBox(
            width: context.getWidth(multiply: 0.055),
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Color(0xff181D27)),
          ),
        ],
      ),
    );
  }
}