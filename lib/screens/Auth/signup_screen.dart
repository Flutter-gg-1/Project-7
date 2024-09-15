import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management_app/screens/Auth/auth_screen.dart';
import 'package:project_management_app/screens/Auth/auth_bloc/auth_bloc.dart';
import 'package:project_management_app/screens/Auth/otp_Screan.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<CreateAccountBloc>();

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: BlocListener<CreateAccountBloc, CreateAccountState>(
            listener: (context, state) {
                if (state is LoadingState) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) =>
                        Center(child: CircularProgressIndicator()));
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
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.msg)));
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  // Top Image
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/logo-h 2 (1).png',
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Register Text
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 4.h,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffA380FF),
                            ),
                          ),
                          SizedBox(height: 3.h),

                          // Email Input Field
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd9d4f1).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: bloc.controllerEmail,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle:
                                    TextStyle(color: Color(0xff4129B7)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),

                          // First Name Input Field
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd9d4f1).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: bloc.controllerFName,
                              decoration: const InputDecoration(
                                hintText: 'First name',
                                hintStyle:
                                    TextStyle(color: Color(0xff4129B7)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),

                          // Last Name Input Field
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd9d4f1).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: bloc.controllerLName,
                              decoration: const InputDecoration(
                                hintText: 'Last name',
                                hintStyle:
                                    TextStyle(color: Color(0xff4129B7)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),

                          // Sign Up Button
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: SizedBox(
                              width: double.infinity,
                              height: 6.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  bloc.add(CreateEvent());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF321f8d),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 2.5.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Image
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        SizedBox(height: 1.h),
                        Image.asset(
                          'assets/Tuwaiq_mounten 2.png',
                          width: 100.w,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
