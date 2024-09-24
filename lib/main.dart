import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuwaiq_project/screens/profile/cubit_profile/profile_cubit.dart';
import 'package:tuwaiq_project/screens/profile/cv_handle_cubit/cv_handle_cubit.dart';
import 'package:tuwaiq_project/screens/profile/img_handle_cubit/img_handle_cubit.dart';

import 'package:tuwaiq_project/screens/splach/splach_screen.dart';

import 'package:tuwaiq_project/services/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  // await authLocator.get<AuthLayerData>().logOut();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => ImgHandleCubit(),
        ),
        BlocProvider(
          create: (context) => CvHandleCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplachScreen()),
    );
  }
}
