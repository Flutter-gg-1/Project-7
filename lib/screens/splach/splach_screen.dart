// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/screens/auth/login_screen.dart';
import 'package:tuwaiq_project/screens/home_screen.dart';
import 'package:tuwaiq_project/screens/splach/cubit/splach_cubit.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplachCubit()..checkLogin(),
      child: BlocListener<SplachCubit, SplachState>(
        listener: (context, state) async {
          await Future.delayed(const Duration(seconds: 3));
          if (state is LoginUserState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          }
          if (state is NotLoginUserState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          }
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(82, 109, 29, 189),
                    Color.fromARGB(255, 72, 13, 127),
                    Color.fromARGB(255, 39, 1, 61),
                  ],
                  stops: [
                    0.15,
                    0.55,
                    0.88
                  ]),
              image: DecorationImage(
                  image: AssetImage('assets/image/splach_background.png'),
                  fit: BoxFit.cover)),
          child: const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
