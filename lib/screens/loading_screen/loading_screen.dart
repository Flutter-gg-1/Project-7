import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/screens/auth/login_screen.dart';
import 'package:project_judge/screens/home_screen.dart';
import 'package:project_judge/screens/loading_screen/cubit/loading_screen_cubit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingScreenCubit()..checkToken(),
      child: Builder(builder: (context) {
        return BlocListener<LoadingScreenCubit, LoadingScreenState>(
          listener: (context, state) {
            if (state is LoadingState) {
              const CircularProgressIndicator();
            }
            if (state is LoggedInState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
            if (state is NotLoggedInState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
            }
          },
          child: const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }),
    );
  }
}
