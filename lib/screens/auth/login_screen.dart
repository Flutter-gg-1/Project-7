import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/auth/bloc/auth_bloc.dart';
import 'package:tuwaiq_project/screens/auth/otp_screen.dart';
import 'package:tuwaiq_project/screens/auth/signup_screen.dart';
import 'package:tuwaiq_project/screens/home_screen.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/custom_text_form_feild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<AuthBloc>();

        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )));
            }

            if (state is SuccessState) {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  OtpScreen(email: bloc.controllerEmail!.text)));
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.msg,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/auth_background.jpg'),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            left: context.getWidth(multiply: 0.2),
                            top: context.getHeight(multiply: 0.15),
                            child: Image.asset('assets/image/login.png')),
                        CustomPaint(
                          size: Size(context.getWidth(multiply: 1),
                              context.getHeight(multiply: 0.1)),
                          painter: AuthShape(),
                        ),
                        Positioned(
                          left: context.getWidth(multiply: 0.85),
                          top: context.getHeight(multiply: 0.1),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  bloc.add(LanguageChangeEvent());
                                },
                                icon: const Icon(Icons.translate_sharp),
                                color: bloc.language.isArabic
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              Text(
                                bloc.language.isArabic ? 'عربي' : 'English',
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            left: context.getWidth(multiply: 0.33),
                            top: context.getHeight(multiply: 0.4),
                            child: Text(
                              !bloc.language.isArabic
                                  ? 'Greeting'
                                  : 'حياك       ',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            )),
                        Center(
                          child: Column(
                            children: [
                              context.addSpacer(multiply: 0.5),
                              CustomTextFormFeild(
                                arabicTitle: 'الايميل',
                                englishTitle: 'E-mail',
                                controller: bloc.controllerEmail,
                                icon: const Icon(Icons.email),
                                isArabic: bloc.language.isArabic,
                              ),
                              context.addSpacer(multiply: 0.06),
                              CustomButton(
                                onPressed: () {
                                  bloc.add(LoginEvent());
                                },
                                arabic: bloc.language.isArabic,
                                arabicTitle: 'تسجيل الدخول',
                                englishTitle: 'Login',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: !bloc.language.isArabic
                                    ? [
                                        Text(bloc.language.isArabic
                                            ? 'ليس لديك حساب؟'
                                            : 'Don’t have an account?'),
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SignupScreen())),
                                            child: Text(bloc.language.isArabic
                                                ? 'انشاء حساب'
                                                : 'Create'))
                                      ]
                                    : [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SignupScreen())),
                                            child: Text(bloc.language.isArabic
                                                ? 'انشاء حساب'
                                                : 'Create')),
                                        Text(bloc.language.isArabic
                                            ? 'ليس لديك حساب؟'
                                            : 'Don’t have an account?'),
                                      ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
