import 'package:flutter/material.dart';
import 'package:project_7/src/helper/setup.dart';
import 'package:project_7/src/screens/auth/login_screen.dart';
import 'package:project_7/src/screens/user/project_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProjectScreen());
  }
}
