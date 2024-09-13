import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/screens/auth/cubit/auth_cubit.dart';
import 'package:project_judge/screens/auth/login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiNetowrok api = ApiNetowrok();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        final bloc = context.read<AuthCubit>();
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: bloc.emailController,
                    ),
                    TextFormField(
                      controller: bloc.fNameController,
                    ),
                    TextFormField(
                      controller: bloc.lNameController,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            await api.createAccount(
                                email: bloc.emailController.text,
                                fName: bloc.fNameController.text,
                                lName: bloc.lNameController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          } catch (e) {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    SnackBar(content: Text(e.toString())));
                          }
                        },
                        child: Icon(Icons.add))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
