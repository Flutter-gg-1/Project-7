import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Bottom_Nav/bottom_nav.dart';
import 'package:project_management_app/services/setup.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await setup();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(), // Wrap your app
    ),
  );
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
