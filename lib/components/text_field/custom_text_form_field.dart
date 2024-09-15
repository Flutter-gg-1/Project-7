import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.icon,
      this.validator,
      this.floatingLabelBehavior});
  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: floatingLabelBehavior,
            filled: true,
            fillColor: const Color(0xffEDEDED),
            hintText: hintText,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        validator: validator,
      ),
    );
  }
}
