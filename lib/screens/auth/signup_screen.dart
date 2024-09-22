import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/auth/bloc/auth_bloc.dart';
import 'package:tuwaiq_project/screens/auth/login_screen.dart';
import 'package:tuwaiq_project/screens/auth/otp_screen.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/custom_text_form_feild.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpScreen(
                            email: bloc.controllerEmail!.text,
                          )));
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
                            left: context.getWidth(multiply: 0.2),
                            top: context.getHeight(multiply: 0.25),
                            child: Text(
                              !bloc.language.isArabic
                                  ? 'Create account'
                                  : 'انشاء حساب       ',
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
                                controller: bloc.controllerEmail,
                                icon: const Icon(Icons.email),
                                isArabic: bloc.language.isArabic,
                              ),
                              context.addSpacer(multiply: 0.03),
                              CustomTextFormFeild(
                                arabicTitle: 'الاسم الاول',
                                englishTitle: 'first name',
                                controller: bloc.controllerFName,
                                icon: const Icon(Icons.person),
                                isArabic: bloc.language.isArabic,
                              ),
                              context.addSpacer(multiply: 0.03),
                              CustomTextFormFeild(
                                arabicTitle: 'الاسم الاخير',
                                englishTitle: 'last name',
                                controller: bloc.controllerLName,
                                icon: const Icon(Icons.person),
                                isArabic: bloc.language.isArabic,
                              ),
                              context.addSpacer(multiply: 0.06),
                              CustomButton(
                                onPressed: () {
                                  bloc.add(CreateAccountEvent());
                                },
                                arabic: bloc.language.isArabic,
                                arabicTitle: 'انشاء حساب',
                                englishTitle: 'Signup',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: !bloc.language.isArabic
                                    ? [
                                        Text(bloc.language.isArabic
                                            ? ' لديك حساب؟'
                                            : 'Do you have account?'),
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginScreen())),
                                            child: Text(bloc.language.isArabic
                                                ? 'تسجيل الدخول'
                                                : 'Login'))
                                      ]
                                    : [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginScreen())),
                                            child: Text(bloc.language.isArabic
                                                ? 'تسجيل الدخول'
                                                : 'Login')),
                                        Text(bloc.language.isArabic
                                            ? ' لديك حساب؟'
                                            : 'Do you have account?'),
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
