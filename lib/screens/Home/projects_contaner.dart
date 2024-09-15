import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Home/project_details.dart';
import 'package:sizer/sizer.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to Project Details Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProjectDetailsScreen(), // Define your details screen here
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.4.h, left: 9.w, right: 1.4.w),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                height: 7.5.h,
                width: 7.5.h,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D4F1),
                  borderRadius: BorderRadius.circular(1.4.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.4,
                      blurRadius: 3.5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.image,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 3.5.w),
            Flexible(
              flex: 7,
              child: Container(
                height: 10.5.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D4F1),
                  borderRadius: BorderRadius.circular(1.4.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.4,
                      blurRadius: 3.5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Project Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 8.4.sp,
                        ),
                      ),
                      SizedBox(height: 0.7.h),
                      Text(
                        "Bootcamp: Flutter Bootcamp",
                        style: TextStyle(fontSize: 7.sp),
                      ),
                      SizedBox(height: 0.7.h),
                      Text(
                        "Type: Mobile App",
                        style: TextStyle(fontSize: 7.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
