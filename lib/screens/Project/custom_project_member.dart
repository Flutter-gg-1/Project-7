import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';

class CustomProjectMember extends StatelessWidget {
  const CustomProjectMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
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
      child: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Student 1',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Camp A',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
