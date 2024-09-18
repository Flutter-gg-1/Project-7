import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadSection extends StatelessWidget {
 final String title;
  final VoidCallback onButtonPressed;
  final VoidCallback onSavePressed;
  final File? file;

  const UploadSection({
    required this.title,
    required this.onButtonPressed,
    required this.onSavePressed,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff4129B7))),
        const SizedBox(height: 10),
        DottedBorder(
          color: const Color(0xffD9D9D9),
          strokeWidth: 1,
          child: Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
              child: file == null
                  ? IconButton(
                      onPressed: onButtonPressed,
                      icon: const Icon(Icons.file_present, color: Colors.black),
                    )
                  : const Icon(Icons.check_box)),
        ),
        const SizedBox(height: 10),
        Center(
          child: SizedBox(
            height: 30,
            width: 170,
            child: ElevatedButton(
              onPressed: onSavePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4129B7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}