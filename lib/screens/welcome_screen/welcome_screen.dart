import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/custom_elevated_button.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/auth/create_account_screen.dart';
import 'package:project_judge/screens/auth/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SvgPicture.asset("assets/svg/Gallery.svg"),
                  const CustomText(
                    text: 'Dream. Design. Deliver.',
                    color: Color(0xffffffff),
                  ),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccountScreen()));
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
          ),
        ],
      ),
    );
  }
}
