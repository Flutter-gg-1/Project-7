
import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomTextFormFeild extends StatelessWidget {
  final bool isArabic;
  final Icon? icon;
  final String arabicTitle,englishTitle;
  final TextEditingController? controller;
  const CustomTextFormFeild({
    super.key,
    required this.isArabic, required this.icon, required this.arabicTitle, required this.englishTitle, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.03)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: kElevationToShadow[4]),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintTextDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          border: InputBorder.none,
          prefixIconColor: const Color(0xff9A9A9A),
          suffixIconColor: const Color(0xff9A9A9A),
          hintStyle: const TextStyle(color: Color(0xffC8C8C8), height: 2.5),
          prefixIcon: !isArabic ?  icon : null,
          suffixIcon: isArabic ?  icon : null,
          constraints: BoxConstraints(
              maxWidth: context.getWidth(multiply: 0.7),
              minHeight: context.getHeight(multiply: 0.06)),
          hintText: isArabic ? arabicTitle : englishTitle,
        ),
      ),
    );
  }
}
