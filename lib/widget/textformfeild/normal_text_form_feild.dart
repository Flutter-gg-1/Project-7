import 'package:flutter/material.dart';

class NormalTextFormFeild extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? minLines;
  const NormalTextFormFeild({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: minLines,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xffA2A0A0)),
          fillColor: const Color(0xffededed),
          border: const OutlineInputBorder()),
    );
  }
}
