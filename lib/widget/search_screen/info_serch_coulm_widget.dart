import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class InfoSerchCoulmWidget extends StatelessWidget {
  const InfoSerchCoulmWidget({
    super.key,
    required this.tex,
  });

  final String tex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/image/no_project.png',
            height: context.getHeight(multiply: 0.4),
            width:
                context.getWidth(multiply: 0.8), // Ensure image fits in width
            fit: BoxFit.contain, // Keep aspect ratio
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_rounded),
                Flexible(
                  // Ensures text doesn't overflow
                  child: Text(
                    tex,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis, // Handle text overflow
                    maxLines: 1, // Optional: Limit text to 1 line
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
