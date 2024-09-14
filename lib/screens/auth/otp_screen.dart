import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/auth/bloc/auth_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getWidth(multiply: 0.045)),
                  child: Column(
                    children: [
                      context.addSpacer(multiply: 0.08),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                            ),
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      ),
                      Image.asset('assets/image/otp_image.png'),
                      Row(
                        mainAxisAlignment: bloc.language.isArabic
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Text(
                            bloc.language.isArabic
                                ? ':رمز التحقق'
                                : 'OTP Verification: ',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            '*',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          )
                        ],
                      ),
                      context.addSpacer(multiply: 0.02),
                      const Pinput(
                        length: 6,
                      ),
                      context.addSpacer(multiply: 0.01),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                            ),
                            onPressed: () {},
                            child: Text(
                              bloc.language.isArabic
                                  ? 'اعادة ارسال رمز التحقق'
                                  : 'resend OTP',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff57E3D8)),
                            ),
                          )),
                      context.addSpacer(multiply: 0.06),
                      CustomButton(
                        englishTitle: 'Verify',
                        arabicTitle: 'تحقق',
                        onPressed: () {},
                        arabic: bloc.language.isArabic,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
