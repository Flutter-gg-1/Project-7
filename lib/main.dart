import 'package:flutter/material.dart';
import 'package:project_judge/screens/first%20screen/first_screen.dart';
import 'package:project_judge/screens/loading%20screen/loading_screen.dart';
import 'package:project_judge/screens/welcome_screen/welcome_screen.dart';
import 'package:project_judge/setup/init_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}
