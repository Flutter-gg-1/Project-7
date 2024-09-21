import 'package:flutter/material.dart';
import 'package:project_judge/components/text/custom_text.dart';

class CustomManageUsersContainer extends StatelessWidget {
  const CustomManageUsersContainer({
    super.key,
    required this.image,
    required this.title,
    required this.position, this.onChanged, required this.isSwitched,
  });
  final Widget image;
  final String title;
  final String position;
  final Function(bool)? onChanged;
  final bool isSwitched;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2, blurStyle: BlurStyle.outer, offset: Offset(0, 3))
          ]),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: image,
          ),
        ),
        title: CustomText(text: title, size: 16),
        subtitle: CustomText(text: position, size: 12),
        trailing: Switch(
          value: isSwitched,
          onChanged: onChanged,
          activeColor: const Color(0xff57E3D8),
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
          inactiveTrackColor: const Color(0xff848484),
        ),
      ),
    );
  }
}
