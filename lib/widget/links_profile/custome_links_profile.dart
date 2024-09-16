import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeLinksProfile extends StatelessWidget {
  const CustomeLinksProfile({
    super.key,
    this.onTap,
    this.iconLinks,
    this.text,
  });

  final Function()? onTap;
  final FaIcon? iconLinks;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight(multiply: 0.08),
        width: context.getWidth(multiply: 0.08),
        decoration: const BoxDecoration(
            color: Color(0xffCACACA), shape: BoxShape.circle),
        child: Center(
          child: iconLinks ??
              Text(
                text!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
        ),
      ),
    );
  }
}