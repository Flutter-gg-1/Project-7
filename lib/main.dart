import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project_pulse/screens/settings/app_theme/app_theme_cubit.dart';
import 'package:tuwaiq_project_pulse/screens/splash/splash_screen.dart';
import 'package:tuwaiq_project_pulse/services/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIContainer.setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
