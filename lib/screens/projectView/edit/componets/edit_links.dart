import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditLinks extends StatelessWidget {
  const EditLinks({
    super.key,
    required this.languageLayer,
    required this.bloc,
  });

  final LanguageLayer languageLayer;
  final EditBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.08)),
      child: BlocBuilder<EditBloc, EditState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageLayer.isArabic ? 'تعديل الروابط' : 'Edit Links',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '5 / 7 >',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              context.addSpacer(multiply: 0.025),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageLayer.isArabic ? 'رابط GitHub' : 'GitHub Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'GitHub URL',
                    controller: bloc.githubController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic ? 'رابط Figma' : 'Figma Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'Figma URL',
                    controller: bloc.figmaController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic ? 'رابط فيديو' : 'Video Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'Video URL',
                    controller: bloc.videoController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic
                        ? 'رابط Pinterest'
                        : 'Pinterest Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'Pinterest URL',
                    controller: bloc.pinterestController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic
                        ? 'رابط Play Store'
                        : 'Play Store Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'Play Store URL',
                    controller: bloc.playstoreController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic
                        ? 'رابط Apple Store'
                        : 'Apple Store Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'Apple Store URL',
                    controller: bloc.applestoreController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic ? 'رابط APK' : 'APK Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'APK URL',
                    controller: bloc.apkController,
                  ),
                  context.addSpacer(multiply: 0.008),
                  Text(
                    languageLayer.isArabic ? 'رابط ويب' : 'Web Link',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.addSpacer(multiply: 0.008),
                  NormalTextFormFeild(
                    hintText: 'Web URL',
                    controller: bloc.weblinkController,
                  ),
                ],
              ),
              context.addSpacer(multiply: 0.02),
              CustomButton(
                englishTitle: 'Edit Links',
                arabicTitle: 'تعديل الروابط',
                onPressed: () {
                  bloc.add(ChangeLinksEvent());
                },
                arabic: languageLayer.isArabic,
              ),
            ],
          );
        },
      ),
    );
  }
}
