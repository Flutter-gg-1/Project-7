import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.floatingLabelBehavior,
    this.label, this.maximumLines =1,
  });

  final String? label;
  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int maximumLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                style: const TextStyle(
                  color: Color(0xff262626),
                  fontSize: 16,
                ),
              )
            : SizedBox.shrink(),
        TextFormField(
          maxLines: maximumLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
              floatingLabelBehavior: floatingLabelBehavior,
              filled: true,
              fillColor: const Color(0xffEDEDED),
              hintText: hintText,
              prefixIcon: icon != null ? Icon(icon) : null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          validator: validator,
        ),
      ],
    );
  }
}