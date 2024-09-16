import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project_judge/screens/home_screen/home_screen.dart';
import 'package:project_judge/screens/loading%20screen/cubit/loading_screen_cubit.dart';
import 'package:project_judge/screens/welcome_screen/welcome_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingScreenCubit()..checkToken(),
      child: Builder(builder: (context) {
        return BlocListener<LoadingScreenCubit, LoadingScreenState>(
          listener: (context, state) {
            if (state is LoggedInState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
            }
            if (state is NotLoggedInState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Lottie.asset("assets/json/Loading animation.json"),
            ),
          ),
        );
      }),
    );
  }
}
