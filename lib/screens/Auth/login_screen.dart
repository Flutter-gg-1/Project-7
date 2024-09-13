import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Auth/otb_Screan.dart';
import 'package:project_management_app/screens/Auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get screen dimensions
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              child: Image.asset(
                'assets/Group 12.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Center content (Text, Email field, Button)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: screenHeight * 0.04, // 4% of screen height
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA380FF),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.07), // 7% of screen height

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
                          horizontal: screenWidth * 0.05, // 5% of screen width
                          vertical: screenHeight * 0.02, // 2% of screen height
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.06, 
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
                          fontSize:
                              screenHeight * 0.025, // 2.5% of screen height
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // "I'm already an account" text at the bottom
          Positioned(
            bottom: screenHeight * 0.2, // 20% from bottom
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "I'm already an account ",
                  style: TextStyle(
                    fontSize: screenHeight * 0.02, // 2% of screen height
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02, // 2% of screen height
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
            ),
          ),
        ],
      ),
    );
  }
}
