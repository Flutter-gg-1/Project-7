import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 2.h, left: 2.w, right: 2.w), // استخدم Sizer لتحديد المسافات
      child: Row(
        children: [
          // جعل الحاوية الأولى قابلة للتكيف
          Flexible(
            flex: 3, // توزيع المساحة بشكل مناسب
            child: Container(
              height: 15.h, // استخدم 15% من ارتفاع الشاشة للحاوية
              decoration: BoxDecoration(
                color: const Color(0xffD9D4F1),
                borderRadius:
                    BorderRadius.circular(2.h), // زاوية دائرية تناسب الشاشة
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.image,
                    size: 40, color: Colors.white), // أيقونة بدلاً من الصورة
              ),
            ),
          ),
          SizedBox(width: 5.w), // مسافة بين الحاويتين باستخدام Sizer

          // جعل الحاوية الثانية قابلة للتكيف
          Flexible(
            flex: 7, // توزيع المساحة بشكل مناسب
            child: Container(
              height: 15.h, // نفس ارتفاع الحاوية السابقة
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffD9D4F1), // لون الحاوية للنصوص
                borderRadius: BorderRadius.circular(2.h), // زاوية دائرية مناسبة
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
                padding: EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Project Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Bootcamp: Flutter Bootcamp",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Type: Mobile App",
                      style: TextStyle(fontSize: 10.sp),
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
