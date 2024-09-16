import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/setup/init_setup.dart';

import 'screens/view_project_detail_screen/view_project_detail_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    DevicePreview(
      enabled: true,  
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ViewProjectDetailScreen(),
    );
  }
}
