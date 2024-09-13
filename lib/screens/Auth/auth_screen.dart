import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Auth/login_screen.dart';
import 'package:project_management_app/screens/Auth/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
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

          // Background image at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/Tuwaiq_mounten 1.png',
              fit: BoxFit.cover,
              height: screenHeight * 0.3, // 30% of screen height
              width: screenWidth, // Full width of the screen
            ),
          ),

          // Center content (Logo, Buttons, and Text)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/logo-h-white.png',
                  height: screenHeight * 0.15, // 15% of screen height
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height

                // Sign Up button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.25, // 25% of screen width
                      vertical: screenHeight * 0.015, // 1.5% of screen height
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
                SizedBox(height: screenHeight * 0.03), // 3% of screen height

                RichText(
                  text: TextSpan(
                    text: "I'm already an account ",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
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
                                builder: (context) => const SignupScreen(),
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

          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.0001,
            child: Image.asset(
              'assets/Group 10.png',
              height: screenHeight * 0.1,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.1,
            left: screenWidth * 0.0001,
            child: Image.asset(
              'assets/Group 10 (1).png',
              height: screenHeight * 0.15,
            ),
          ),
        ],
      ),
    );
  }
}
