import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/screens/browse_page/browsePage.dart';
import 'package:project_judge/screens/loading%20screen/loading_screen.dart';
import 'package:project_judge/screens/navigation/navigationPage.dart';
import 'package:project_judge/setup/init_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // اعدل عليها اذا خلصت من رن حقي ارجعها زي قبل لا انسى
      home: LoadingScreen(),
    );
  }
}
