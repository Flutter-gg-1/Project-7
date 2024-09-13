import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Auth/auth_screen.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevent the layout from adjusting when the keyboard appears
      body: Stack(
        children: [
          // Top Image
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/logo-h 2 (1).png',
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Register Text
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 4.h, // 4% of screen height
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA380FF),
                    ),
                  ),
                  SizedBox(height: 3.h), // 3% of screen height

                  // Email Input Field
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd9d4f1).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xff4129B7)),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h), // 2% of screen height

                  // First Name Input Field
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd9d4f1).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'First name',
                        hintStyle: TextStyle(color: Color(0xff4129B7)),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),

                  // Last Name Input Field
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd9d4f1).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Last name',
                        hintStyle: TextStyle(color: Color(0xff4129B7)),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF321f8d),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 2.5.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(height: 1.h),
                Image.asset(
                  'assets/Tuwaiq_mounten 2.png',
                  width: 100.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
