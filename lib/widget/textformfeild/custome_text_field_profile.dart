import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeTextFormProfile extends StatelessWidget {
  const CustomeTextFormProfile({
    super.key,
    this.controller,
    this.validator,
    this.contentText,
    required this.hint,
    required this.isArabic,
  });

  final TextEditingController? controller;
  final String Function(String?)? validator;
  final String? contentText;
  final String hint;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(multiply: 0.9),
      height: context.getHeight(multiply: 0.08),
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: TextFormField(
          validator: validator,
          controller: controller,
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          decoration: InputDecoration(
            hintText: hint,
            hintTextDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            hintStyle: const TextStyle(color: Color(0xffA2A0A0)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            fillColor: const Color(0xffA2A0A0),
          ),
        ),
      ),
    );
  }
}
