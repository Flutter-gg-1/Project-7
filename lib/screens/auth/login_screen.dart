import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/auth/bloc/auth_bloc.dart';
import 'package:tuwaiq_project/services/setup.dart';
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

        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/auth_background.jpg'),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is ArabicState) {
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
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
                                color:
                                    state.isArabic ? Colors.blue : Colors.grey,
                              ),
                              Text(
                                state.isArabic ? 'عربي' : 'English',
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            left: context.getWidth(multiply: 0.35),
                            top: context.getHeight(multiply: 0.25),
                            child: Text(
                              !state.isArabic ? 'Greeting' : 'حياك       ',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            )),
                        Center(
                          child: Column(
                            children: [
                              context.addSpacer(multiply: 0.38),
                              CustomTextFormFeild(
                                arabicTitle: 'الايميل',
                                englishTitle: 'E-mail',
                                icon: const Icon(Icons.email),
                                isArabic: state.isArabic,
                              ),
                              context.addSpacer(multiply: 0.2),
                              CustomButton(
                                arabic: state.isArabic,
                                arabicTitle: 'تسجيل الدخول',
                                englishTitle: 'Login',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: !state.isArabic
                                    ? [
                                        Text(state.isArabic
                                            ? 'ليس لديك حساب؟'
                                            : 'Don’t have an account?'),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(state.isArabic
                                                ? 'انشاء حساب'
                                                : 'Create'))
                                      ]
                                    : [
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(state.isArabic
                                                ? 'انشاء حساب'
                                                : 'Create')),
                                        Text(state.isArabic
                                            ? 'ليس لديك حساب؟'
                                            : 'Don’t have an account?'),
                                      ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
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
                          left: context.getWidth(multiply: 0.35),
                          top: context.getHeight(multiply: 0.25),
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
                            context.addSpacer(multiply: 0.38),
                            CustomTextFormFeild(
                              arabicTitle: 'الايميل',
                              englishTitle: 'E-mail',
                              icon: const Icon(Icons.email),
                              isArabic: bloc.language.isArabic,
                            ),
                            context.addSpacer(multiply: 0.2),
                            CustomButton(
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
                                          onPressed: () {},
                                          child: Text(bloc.language.isArabic
                                              ? 'انشاء حساب'
                                              : 'Create'))
                                    ]
                                  : [
                                      TextButton(
                                          onPressed: () {},
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
        );
      }),
    );
  }
}
