import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/custom_elevated_button.dart';
import 'package:project_judge/screens/auth/create_account_screen.dart';
import 'package:project_judge/screens/auth/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/welcomeImage.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(child: Container(color: const Color(0x204D2EB4))),
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SvgPicture.asset("assets/svg/masharee.svg"),
                    const SizedBox(
                      height: 3,
                    ),
                    SvgPicture.asset("assets/svg/Gallery.svg"),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButton(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 63),
                            backgroundColor: const Color(0xff4D2EB4),
                            text: "Log in",
                            textcolor: Colors.white,
                            onPressed: () {
                              _navigateToPage(1);
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomElevatedButton(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 63),
                            backgroundColor: Colors.white,
                            text: "Sign up",
                            textcolor: const Color(0xff4D2EB4),
                            onPressed: () {
                              _navigateToPage(2);
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const LoginScreen(),
              const CreateAccountScreen(),
            ],
          ),
        ],
      ),
    );
  }
}
