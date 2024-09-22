import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.floatingLabelBehavior,
<<<<<<< HEAD
    this.label, this.maximumLines =1, this.fillColor,
=======
    this.label,
    this.maximumLines = 1,
    this.onChange,
>>>>>>> origin/linda
  });

  final String? label;
  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int maximumLines;
  final Color? fillColor;

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
            : const SizedBox.shrink(),
        TextFormField(
          onChanged: onChange,
          maxLines: maximumLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
              floatingLabelBehavior: floatingLabelBehavior,
              filled: true,
<<<<<<< HEAD
              fillColor: fillColor ?? const Color(0xffEDEDED),
=======
              fillColor: const Color.fromARGB(255, 232, 232, 232),
>>>>>>> origin/linda
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 12),
              prefixIcon: icon != null ? Icon(icon) : null,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffFF8182)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorStyle: TextStyle(color: Color(0xffFF8182))),
          validator: validator,
        ),
      ],
    );
  }
}
