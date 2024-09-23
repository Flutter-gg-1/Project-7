import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:project_judge/components/dialog/error_dialog.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/auth/cubit/auth_cubit.dart';
import 'package:project_judge/screens/navigation/navigationPage.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, required this.email});
  final String email;

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
                        backgroundColor: Colors.transparent,
                        content:
                            Lottie.asset("assets/json/Loading animation.json"),
                      ));
            }
            if (state is SuccessState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()));
            }
            if (state is ResendOtpState) {
              Navigator.pop(context);
            }
            if (state is ErrorState) {
              showErrorDialog(context, state.msg);
            }
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/loginImage.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height - 136),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0x65000000),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 100),
                          child: Column(
                            children: [
                              const CustomText(
                                  text: "Verification code",
                                  size: 32,
                                  color: Colors.white),
                              const SizedBox(height: 50),
                              SizedBox(
                                width: 318,
                                height: 48,
                                child: RichText(
                                  text: TextSpan(children: [
                                    const TextSpan(
                                      text:
                                          "Please enter the code that has been sent to the email ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: email,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff57E3D8),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              const SizedBox(height: 60),
                              Pinput(
                                  cursor: Column(
                                    children: [
                                      Container(
                                        width: 49,
                                        height: 46,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: const Color(0xff4D2EB4),
                                                width: 2)),
                                      )
                                    ],
                                  ),
                                  pinAnimationType: PinAnimationType.scale,
                                  defaultPinTheme: PinTheme(
                                      width: 49,
                                      height: 48,
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  focusedPinTheme: PinTheme(
                                      width: 49,
                                      height: 48,
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff4D2EB4)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white)),
                                  controller: cubit.otpController,
                                  length: 6,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onCompleted: (pin) {
                                    cubit.checkAuth(email: email);
                                  }),
                              const SizedBox(height: 10),
                              TextButton(
                                  onPressed: () {
                                    cubit.otpController.clear();
                                    cubit.resendOTP(email: email);
                                  },
                                  child: const CustomText(
                                    text: "Resend OTP",
                                    size: 14,
                                    color: Colors.white,
                                    weight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: -50,
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Image.asset("assets/images/logo-h 2.png"),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
