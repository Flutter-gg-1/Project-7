import 'package:flutter/material.dart';

class BootcampColumn extends StatelessWidget {
  final String imagePath, title;
  final Function()? onTap;
  const BootcampColumn({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(imagePath),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
