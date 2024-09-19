import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:project_judge/components/dialog/error_dialog.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/auth/cubit/auth_cubit.dart';
import 'package:project_judge/screens/navigation/navigationPage.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NavigationPage()));
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
                        decoration: const BoxDecoration(
                            color: Color(0x65000000),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40))),
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
                      const Positioned(
                        top: 90,
                        left: 80,
                        child: Text(
                          "Verification code",
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 318,
                        height: 48,
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text:
                                  "Please enter the code that has been sent to the email ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: email,
                              style: const TextStyle(
                                color: Color(0xff57E3D8),
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      Pinput(
                          defaultPinTheme: defaultPinTheme,
                          controller: cubit.otpController,
                          length: 6,
                          onCompleted: (pin) {
                            cubit.checkAuth(email: email);
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      TextButton(
                          onPressed: () {
                            cubit.otpController.clear();

                            cubit.resendOTP(email: email);
                          },
                          child: Column(
                            children: [
                              CircularCountDownTimer(
                                  onStart: () {},
                                  isTimerTextShown: false,
                                  isReverseAnimation: true,
                                  isReverse: true,
                                  width: 45,
                                  height: 45,
                                  duration: 59,
                                  fillColor: Colors.blueAccent,
                                  ringColor: Colors.blueGrey),
                              const CustomText(
                                text: "Resend OTP",
                                size: 24,
                                color: Colors.white,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ))
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
