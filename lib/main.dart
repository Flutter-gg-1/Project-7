import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Auth/auth_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          home: AuthScreen(),
        );
      },
    );
  }
}
