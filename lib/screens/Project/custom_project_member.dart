import 'package:flutter/material.dart';
import 'package:project_management_app/models/member_model.dart';
import 'package:project_management_app/theme/appcolors.dart';

class CustomProjectMember extends StatelessWidget {
  final MemberModel member;
  const CustomProjectMember({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 110,
          width: 170,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.blueLight,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${member.firstName} ${member.lastName}',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  member.email!,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  'Position: ${member.position!}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -60,
          child: Container(
            width: 90,
            height: 100,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: const CircleBorder(
                side: BorderSide(width: 3, color: Colors.white),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
                child: CircleAvatar(
                    radius: 40,
                    backgroundImage: member.imageUrl != null
                        ? const AssetImage(
                            'assets/pfp.png',
                          )
                        : NetworkImage(member.imageUrl!))),
          ),
        ),
      ],
    );
  }
}
