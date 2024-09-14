import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                borderRadius: BorderRadius.circular(1.4.h), // زاوية دائرية أصغر
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.4, // تقليل الظل
                    blurRadius: 3.5, // تقليل الضبابية
                    offset: const Offset(0, 2), // تقليل موضع الظل
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.image,
                    size: 28, color: Colors.white), // تقليل حجم الأيقونة
              ),
            ),
          ),
          SizedBox(width: 3.5.w), // تقليل المسافة بين الحاويتين

          Flexible(
            flex: 7,
            child: Container(
              height: 10.5.h, // تقليل الارتفاع بنسبة 30%
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffD9D4F1),
                borderRadius: BorderRadius.circular(1.4.h), // زاوية دائرية أصغر
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.4, // تقليل الظل
                    blurRadius: 3.5, // تقليل الضبابية
                    offset: const Offset(0, 2), // تقليل موضع الظل
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(1.4.h), // تقليل المسافات الداخلية
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Project Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8.4.sp, // تقليل حجم الخط بنسبة 30%
                      ),
                    ),
                    SizedBox(height: 0.7.h), // تقليل المسافة الداخلية
                    Text(
                      "Bootcamp: Flutter Bootcamp",
                      style: TextStyle(fontSize: 7.sp), // تقليل حجم الخط
                    ),
                    SizedBox(height: 0.7.h), // تقليل المسافة الداخلية
                    Text(
                      "Type: Mobile App",
                      style: TextStyle(fontSize: 7.sp), // تقليل حجم الخط
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
