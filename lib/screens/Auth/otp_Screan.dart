import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(top: 10.h, bottom: 5.h), // Adjust using Sizer
              child: Image.asset(
                'assets/TA.png',
                height: 12.h, // 12% of screen height
              ),
            ),
            SizedBox(height: 4.h), // 4% of screen height
            Text(
              'Enter the OTP sent to your phone',
              style: TextStyle(
                fontSize: 2.5.h, // 2.5% of screen height
                fontWeight: FontWeight.bold,
                color: const Color(0xff57E3D8),
              ),
            ),
            SizedBox(height: 4.h), // Adjust spacing with Sizer
            Text(
              'We have sent the OTP code to [email]',
              style: TextStyle(
                fontSize: 1.6.h, // 1.6% of screen height
                fontWeight: FontWeight.bold,
                color: const Color(0xff4129B7),
              ),
            ),
            SizedBox(height: 10.h), // 10% of screen height
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 8.w), // Adjust using Sizer
              child: Center(
                child: Pinput(
                  keyboardType: TextInputType.number,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  showCursor: true,
                  onCompleted: (pin) {
                    print('OTP entered: $pin');
                  },
                ),
              ),
            ),
            SizedBox(height: 5.h), // 5% of screen height
            Text(
              'Resend OTP',
              style: TextStyle(
                fontSize: 2.h, // 2% of screen height
                color: const Color(0xff4129B7),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h), // Adjust spacing with Sizer
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.w), // Adjust using Sizer
              child: SizedBox(
                width: 90.w, // 90% of screen width
                height: 7.h, // 7% of screen height
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff57E3D8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2.5.h, // 2.5% of screen height
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
