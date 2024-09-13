import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tuwaiq_project_pulse/screens/auth/auth_screen.dart';

import '../../managers/auth_mgr.dart';
import '../bottom_nav_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final authMgr = GetIt.I.get<AuthMgr>();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Text('Splash Screen :)'),
      nextScreen: (authMgr.authData == null)
          ? const AuthScreen()
          : const BottomNavScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.white60,
      duration: 2000,
    );
  }
}
