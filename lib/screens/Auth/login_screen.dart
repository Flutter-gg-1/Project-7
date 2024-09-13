import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import Sizer package
import 'package:project_management_app/screens/Auth/otb_Screan.dart';
import 'package:project_management_app/screens/Auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This will ensure screen adjusts for the keyboard
      body: SingleChildScrollView(
        // Ensures the screen is scrollable when keyboard appears
        child: Column(
          children: [
            // Background image
            Container(
              width: 100.w, // 100% of screen width using Sizer
              height: 40.h, // Adjust height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Group 12.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.w), // 10% of screen width
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 4.h, // 4% of screen height using Sizer
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA380FF),
                    ),
                  ),
                  SizedBox(height: 7.h), // 7% of screen height using Sizer

                  // Email input field
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Color(0xff4129B7)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 5.w, // 5% of screen width using Sizer
                          vertical: 2.h, // 2% of screen height using Sizer
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h), // 5% of screen height using Sizer

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 6.h, // 6% of screen height using Sizer
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtbScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF321f8d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.5.h, // 2.5% of screen height using Sizer
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h), // Add some spacing

            // "I'm already an account" text at the bottom
            RichText(
              text: TextSpan(
                text: "I'm already an account ",
                style: TextStyle(
                  fontSize: 2.h, // 2% of screen height using Sizer
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      fontSize: 2.h, // 2% of screen height using Sizer
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffFF8181),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
