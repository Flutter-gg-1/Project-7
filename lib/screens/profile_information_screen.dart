import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/dilog/dilog_profile.dart';
import 'package:tuwaiq_project/widget/links_profile/custome_links_profile.dart';
import 'package:tuwaiq_project/widget/links_profile/custome_title_text_profile.dart';
import 'package:tuwaiq_project/widget/textformfeild/custome_text_field_profile.dart';

class ProfileInformationScreen extends StatelessWidget {
  const ProfileInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = languageLocaitor.get<LanguageLayer>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              size: Size(context.getWidth(multiply: 1),
                  context.getHeight(multiply: 0.1)),
              painter: AuthShape(),
            ),
            Container(
              height: context.getHeight(multiply: 0.19),
              width: context.getWidth(multiply: 0.19),
              decoration: const BoxDecoration(
                  color: Color(0xffCACACA), shape: BoxShape.circle),
              child: Image.asset('assets/image/Search-amico(1).png'),
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    'Itunuoluwa Abidoye',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Itunuoluwa@petra.africa',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const CustomeTitleText(
              title: 'First Name',
            ),
            const CustomeTextFormProfile(
              hint: 'first name',
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.035),
            ),
            const CustomeTitleText(
              title: 'Last Name',
            ),
            const CustomeTextFormProfile(
              hint: 'last name',
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.035),
            ),
            const CustomeTitleText(
              title: 'Email',
            ),
            const CustomeTextFormProfile(
              hint: 'email',
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.035),
            ),
            const CustomeTitleText(
              title: 'CV',
            ),
            const CustomeTextFormProfile(
              hint: 'Pitch_deck_final2.pdf',
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.035),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomeLinksProfile(
                  iconLinks: const FaIcon(
                    FontAwesomeIcons.linkedinIn,
                    color: Colors.white,
                  ),
                  onTap: () {
                    dialog(context: context, onDone: () {});
                  },
                ),
                CustomeLinksProfile(
                  iconLinks: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  onTap: () {
                    dialog(context: context, onDone: () {});
                  },
                ),
                CustomeLinksProfile(
                  iconLinks: const FaIcon(
                    FontAwesomeIcons.discord,
                    color: Colors.white,
                  ),
                  onTap: () {
                    dialog(context: context, onDone: () {});
                  },
                ),
                CustomeLinksProfile(
                  text: 'CV',
                  onTap: () {
                    dialog(context: context, onDone: () {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.035),
            ),
            CustomButton(
              onPressed: () {},
              arabicTitle: 'تعديل',
              englishTitle: 'Update',
              arabic: language.isArabic,
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.035),
            ),
          ],
        ),
      )),
    );
  }
}
