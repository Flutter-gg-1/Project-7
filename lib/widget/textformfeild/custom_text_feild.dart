import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final bool isArabic;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  //final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const CustomTextFeild(
      {super.key,
      required this.hintText,
      this.maxLines,
      this.controller,
      this.validator,
      this.keyboardType,
      this.padding,
      this.initialValue,
      this.onChanged,
      this.onFieldSubmitted,
      required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      keyboardType: keyboardType,
      //inputFormatters: inputFormatters,
      validator: validator,
      controller: controller,
      minLines: maxLines,
      maxLines: maxLines,
      initialValue: initialValue,
      onChanged: onChanged,

      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search),
          hintText: hintText,
          hintTextDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xffb8b8b8)),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
