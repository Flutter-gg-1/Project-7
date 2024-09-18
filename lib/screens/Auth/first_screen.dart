import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management_app/screens/Auth/auth_screen.dart';
import 'package:project_management_app/screens/Bottom_Nav/bottom_nav.dart';
import 'load_token_cubit/load_cubit.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadTokenCubit()..checkLogin(),
      child: BlocListener<LoadTokenCubit, LoadTokenState>(
        listener: (context, state) {
          if (state is LoggedInUserState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BottomNav()));
          }
          if (state is LoggedOutUserState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AuthScreen()));
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
