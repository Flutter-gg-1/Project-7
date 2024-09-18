import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import Sizer package
import 'package:project_management_app/screens/Auth/login_screen.dart';
import 'package:project_management_app/screens/Auth/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFA380FF),
                  Color(0xFF2F1E84),
                  Color(0xff1D1251),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/Tuwaiq_mounten 1.png',
              fit: BoxFit.cover,
              height: 30.h,
              width: 100.w,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/logo-h-white.png',
                  height: 15.h,
                ),
                SizedBox(height: 5.h),

                // Sign Up button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 1.5.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xffFFFFFF).withOpacity(0.72),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xff4129B7),
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),

                RichText(
                  text: TextSpan(
                    text: "I already have an account",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                Color(0xFFFFA17F),
                                Color(0xFFFF8181),
                              ],
                            ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                            ),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Top right icon
          Positioned(
            top: 10.h,
            right: 0.1.w,
            child: Image.asset(
              'assets/Group 10.png',
              height: 10.h,
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 0.1.w,
            child: Image.asset(
              'assets/Group 10 (1).png',
              height: 15.h,
            ),
          ),
        ],
      ),
    );
  }
}
