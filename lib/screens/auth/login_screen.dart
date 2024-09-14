import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/screens/auth/cubit/auth_cubit.dart';
import 'package:project_judge/screens/auth/verify_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<AuthCubit>();
        return BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: CircularProgressIndicator(),
                      ));
            }
            if (state is SuccessState) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyScreen(
                          email: cubit.emailLoginController.text)));
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text(state.msg),
                      ));
            }
          },
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: cubit.emailLoginController,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.checkLogin();
                      },
                      child: Text("Log in"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
