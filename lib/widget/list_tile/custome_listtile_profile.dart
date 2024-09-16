import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeListTileProfile extends StatelessWidget {
  const CustomeListTileProfile({
    super.key,
    required this.text,
    required this.colorText,
    required this.iconListTile,
    this.onTap,
  });

  final String text;
  final Color colorText;
  final Icon iconListTile;
  final Function()? onTap;
  //'Help & Support'
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: context.getHeight(multiply: 0.08),
          width: context.getWidth(multiply: 0.08),
          decoration: const BoxDecoration(
              color: Color(0xffCACACA), shape: BoxShape.circle),
          child: Center(child: iconListTile)),
      title: Text(
        text,
        style: TextStyle(color: colorText),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}