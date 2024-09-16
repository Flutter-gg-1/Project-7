import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, this.onPressed});
  final Widget icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
                onPressed: onPressed,
                icon: icon
              );
  }
}