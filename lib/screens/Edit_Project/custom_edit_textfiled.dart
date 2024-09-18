import 'package:flutter/material.dart';

class CustomEditTextfiled extends StatelessWidget {
   final String label;
  final TextEditingController controller;
  final bool isDate;
  final bool isMultiline;

  const CustomEditTextfiled({
    required this.label,
    required this.controller,
    this.isDate = false,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        maxLines: isMultiline ? 3 : 1,
      ),
    );
  }
}