import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';

class Out_Standing_Student extends StatelessWidget {
  const Out_Standing_Student({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
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
                              color: Colors.black.withOpacity(
                                  0.3), // Adjust the opacity of the shadow
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius:
                                  3, // Blur radius to make the shadow softer
                              offset: const Offset(
                                  0, 1), // Position the shadow (X, Y)
                            ),
                          ],
                        ),
                        child: const Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/R 2.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /**
               * 
               * 
               * Endedd of container for Student 1
               * 
               */
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
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
                    ),
                    Positioned(
                      top: -60,
                      child: Container(
                        width: 90,
                        height: 100,
                        child: const Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/R 2.png',
                            ),
                          ),
                        ),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: const CircleBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.3), // Adjust the opacity of the shadow
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius:
                                  3, // Blur radius to make the shadow softer
                              offset: const Offset(
                                  0, 1), // Position the shadow (X, Y)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          /**
               * 
               * 
               * Endedd of container for Student 2
               * 
               */
          const SizedBox(
            height: 40,
          ),
          const SizedBox(height: 20), // Add space between rows
          Row(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
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
                    ),
                    Positioned(
                      top: -60,
                      child: Container(
                        width: 90,
                        height: 100,
                        child: const Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/R 2.png',
                            ),
                          ),
                        ),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: const CircleBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.3), // Adjust the opacity of the shadow
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius:
                                  3, // Blur radius to make the shadow softer
                              offset: const Offset(
                                  0, 1), // Position the shadow (X, Y)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /**
               * 
               * 
               * Endedd of container for Student 4
               * 
               */

              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
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
                    ),
                    Positioned(
                      top: -60,
                      child: Container(
                        width: 90,
                        height: 100,
                        child: const Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/R 2.png',
                            ),
                          ),
                        ),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: const CircleBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.3), // Adjust the opacity of the shadow
                              spreadRadius: 2, // Spread radius of the shadow
                              blurRadius:
                                  3, // Blur radius to make the shadow softer
                              offset: const Offset(
                                  0, 1), // Position the shadow (X, Y)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
