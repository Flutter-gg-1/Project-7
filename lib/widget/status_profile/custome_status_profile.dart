import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeStatusProfile extends StatelessWidget {
  const CustomeStatusProfile({
    super.key,
    required this.rating,
    required this.icon,
    required this.textTitle,
    this.onTap,
  });

  final Function()? onTap;
  final String rating;
  final Icon icon;
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight(multiply: 0.13),
        width: context.getWidth(multiply: 0.4),
        decoration: BoxDecoration(
            color: const Color(0xffE7E9F4),
            borderRadius: BorderRadius.circular(22)),
        child: Center(
          child: ListTile(
              title: Text(
                textTitle,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                rating,
                textAlign: TextAlign.center,
              ),
              leading: icon),
        ),
      ),
    );
  }
}