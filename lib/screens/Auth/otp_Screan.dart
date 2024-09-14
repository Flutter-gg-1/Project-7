import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:project_management_app/Bottom_Nav/bottom_nav.dart';
import 'package:project_management_app/screens/Auth/cubit/verify_cubit.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 12.w,
      height: 7.h,
      textStyle: TextStyle(
        fontSize: 3.h,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff57E3D8)),
      ),
    );

    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: Builder(builder: (context) {
        return BlocListener<VerifyCubit, VerifyState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else if (state is SuccessState) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BottomNav()),
              );
            } else if (state is ErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state
                        .message)), // Display the error message from the state
              );
            }
          },
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                    child: Image.asset(
                      'assets/TA.png',
                      height: 12.h,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Enter the OTP sent to your Email',
                    style: TextStyle(
                      fontSize: 2.5.h,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff57E3D8),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'We have sent the OTP code to',
                    style: TextStyle(
                      fontSize: 1.6.h,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4129B7),
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 1.6.h,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4129B7),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Center(
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        showCursor: true,
                        onCompleted: (pin) {
                          context.read<VerifyCubit>().verifyMethod(
                                email: email,
                                otp: pin,
                              );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OTP Resent!')),
                      );
                    },
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        fontSize: 2.h,
                        color: const Color(0xff4129B7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
