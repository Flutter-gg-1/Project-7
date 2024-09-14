import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 15.h,
            width: 24.w,
            decoration: BoxDecoration(
              color: const Color(0xffD9D4F1), // لون الحاوية
              borderRadius: BorderRadius.circular(10), // جعل الحواف دائرية
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // ظل الحاوية
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // موضع الظل
                ),
              ],
            ),
            child: const Center(
              child: Icon(Icons.image,
                  size: 40, color: Colors.white), // أيقونة بدلاً من الصورة
            ),
          ),
          const SizedBox(width: 10), // مسافة بين الحاويتين

          Container(
            height: 15.h,
            width: 60.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffD9D4F1), // لون الحاوية للنصوص
              borderRadius: BorderRadius.circular(10), // جعل الحواف دائرية
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // ظل الحاوية
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // موضع الظل
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0), // مسافة داخلية للحاوية
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Project Name", // الاسم
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Bootcamp: Flutter Bootcamp"), // المعسكر
                  SizedBox(height: 2),
                  Text("Type: Mobile App"), // النوع
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
