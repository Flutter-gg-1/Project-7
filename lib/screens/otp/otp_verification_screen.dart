import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:project7/constants/app_constants.dart';
import 'package:project7/extensions/screen_navigation.dart';
import 'package:project7/extensions/screen_size.dart';
import 'package:project7/screens/navigation/navigation_screen.dart';
import 'package:project7/screens/otp/bloc/otp_bloc.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<OtpBloc>();
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is LoadingState) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()));
              }
              if (state is SuccessState) {
                log("success 1");
                Navigator.pop(context);
                log("success 2");
                context.pushReplacement(screen: const NavigationScreen());
                log("success 3");
              }
              if (state is ResendedState) {
                log("success 1");
                Navigator.pop(context);
              }
              if (state is ErrorState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("There is an error")));
              }
            },
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          child: Image.asset("assets/images/tuwaiq.png",
                              width: context.getWidth(), fit: BoxFit.cover)),
                      SizedBox(
                        height: context.getHeight(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset('assets/images/tuwaiq_logo2.png',
                                  height: 105, width: 243),
                              const SizedBox(height: 106),
                              const Text('OTP VERIFICATION',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Enter the OTP sent to : ',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                  Text(email,
                                      style: const TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              const SizedBox(height: 38),
                              Pinput(
                                  keyboardType: TextInputType.number,
                                  length: 6,
                                  onCompleted: (otp) => bloc
                                      .add(VerifyEvent(email: email, otp: otp)),
                                  defaultPinTheme: PinTheme(
                                    width: 50,
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    textStyle: const TextStyle(
                                        fontFamily: 'Lato', fontSize: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff282828)
                                                .withOpacity(.5),
                                            width: .6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )),
                              const SizedBox(height: 38),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Didn't receive code ? ",
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                  OtpTimerButton(
                                    buttonType: ButtonType.text_button,
                                    onPressed: () {
                                      bloc.add(ResendOtpEvent(email: email));
                                    },
                                    text: const Text(
                                      'Re-send',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppConstants.mainPurple),
                                    ),
                                    duration: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      }),
    );
  }
}
