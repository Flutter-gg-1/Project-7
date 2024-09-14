
import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, top: 20),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color(0xffD9D4F1), // لون الحاوية
              borderRadius: BorderRadius.circular(
                  10), // جعل الحواف دائرية
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(0.5), // ظل الحاوية
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // موضع الظل
                ),
              ],
            ),
            child: Center(
              child: Icon(Icons.image,
                  size: 40,
                  color: Colors
                      .white), // أيقونة بدلاً من الصورة
            ),
          ),
          const SizedBox(width: 10), // مسافة بين الحاويتين
    
          Container(
            height: 100,
            width: 250,
            decoration: BoxDecoration(
              color:
                  Color(0xffD9D4F1), // لون الحاوية للنصوص
              borderRadius: BorderRadius.circular(
                  10), // جعل الحواف دائرية
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(0.5), // ظل الحاوية
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // موضع الظل
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  8.0), // مسافة داخلية للحاوية
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project Name", // الاسم
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                      "Bootcamp: Flutter Bootcamp"), // المعسكر
                  const SizedBox(height: 2),
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
