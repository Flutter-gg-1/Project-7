import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class InfoSerchCoulmWidget extends StatelessWidget {
  const InfoSerchCoulmWidget({
    super.key, required this.tex,
  });

  final String tex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/image/Search-amico(1).png',
          height: context.getHeight(multiply: 0.4),
        ),
         Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search_rounded),
              Text(
                tex,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}
