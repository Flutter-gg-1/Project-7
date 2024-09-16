import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Home/project_details.dart';
import 'package:sizer/sizer.dart';

class Projects extends StatelessWidget {
  final String projectName;
  final String bootcampName;
  final String type;

  const Projects(
      {super.key,
      required this.projectName,
      required this.bootcampName,
      required this.type});

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
                  color: const Color(0xff4129B7),
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
                height: 14.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 10,
                            child: Text(
                              'Project Name: $projectName',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8.4.sp,
                              ),
                            ),
                          ),
                          Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xff4129B7),
                                  borderRadius: BorderRadius.circular(3)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                  onPressed: () {},
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )))
                        ],
                      ),
                      SizedBox(height: 0.7.h),
                      Text(
                        "Bootcamp: $bootcampName",
                        style: TextStyle(fontSize: 7.sp),
                      ),
                      SizedBox(height: 0.7.h),
                      Text(
                        "Type: $type",
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
