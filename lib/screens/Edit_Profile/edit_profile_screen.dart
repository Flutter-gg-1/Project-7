import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:project_management_app/screens/Edit_Profile/custom_edit_links.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> userInfo = ['First Name', 'Last Name'];
    List<String> socialAccounts = ['github', 'BlindLink', 'LinkedIn'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
          child: Column(
            children: [
              Container(
                height: 82,
                width: 319,
                decoration: BoxDecoration(
                    color: const Color(0xff4129B7),
                    borderRadius: BorderRadius.circular(37)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                      height: 68,
                      width: 68,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                         color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 4)
                      ),
                      child: ClipOval(
                        child: Image.asset('assets/R 2.png',
                        width: 68,
                              height: 68,
                              fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Center(
                      child: OutlinedText(
                          text: const Text(
                            'Welcome Back !',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          strokes: [
                            OutlinedTextStroke(
                                color: const Color(0xff828181), width: 2),
                          ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Info:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff57E3D8)),
                  )),
              ...List.generate(userInfo.length, (index) {
                return CustomEditLinks(
                  label: userInfo[index],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Social Accounts:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff57E3D8)),
                  )),
              ...List.generate(socialAccounts.length, (index) {
                return CustomEditLinks(
                  label: socialAccounts[index],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Upload resume: ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold)),
                  DottedBorder(
                    color: const Color(0xffD9D9D9),
                    strokeWidth: 1,
                    child: Container(
                      height: 76,
                      width: 211,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(3)),
                      child: Image.asset('assets/Group 102.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Upload QR Code: ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold)),
                  DottedBorder(
                    color: const Color(0xffD9D9D9),
                    strokeWidth: 1,
                    child: Container(
                      height: 76,
                      width: 211,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(3)),
                      child: Image.asset('assets/Group 102.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
