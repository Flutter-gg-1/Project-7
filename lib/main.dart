import 'package:flutter/material.dart';
import 'package:project_management_app/Bottom_Nav/bottom_nav.dart';
import 'package:project_management_app/screens/Auth/auth_screen.dart';
import 'package:project_management_app/screens/Home/home_screen.dart';
import 'package:project_management_app/services/setup.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          home: BottomNav(),
        );
      },
    );
  }
}
