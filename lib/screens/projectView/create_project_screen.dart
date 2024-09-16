import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/bloc/project_bloc.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/column/images_coulmn.dart';
import 'package:tuwaiq_project/widget/row/date_row.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<ProjectBloc>();
        Future<void> pickImage({
          required ProjectEvent Function(File) createEvent,
          required Function(File) updateImage,
        }) async {
          final ImagePicker picker = ImagePicker();
          XFile? image = await picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            final selectedImage = File(image.path);
            updateImage(selectedImage);
            bloc.add(createEvent(selectedImage));
          }
        }

        var languageLayer = languageLocaitor.get<LanguageLayer>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              CustomPaint(
                size: Size(context.getWidth(multiply: 1),
                    context.getHeight(multiply: 0.1)),
                painter: AuthShape(),
              ),
              BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  return Container(
                      //margin: const EdgeInsets.only(top: 7, bottom: 32),
                      width: double.infinity,
                      height: context.getHeight(multiply: 0.12),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 228, 226, 226)),
                      child: state is ProjectImagesState &&
                              state.profileImage != null
                          ? Image.file(state.profileImage!)
                          : IconButton(
                              onPressed: () {
                                pickImage(
                                    updateImage: (p0) {},
                                    createEvent: (image) =>
                                        ProfileImageChangeEvent(
                                            selectedImage: image));
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 65,
                                color: Color(0xff969696),
                              )));
                },
              ),
              SizedBox(
                height: context.getHeight(multiply: 0.74),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getWidth(multiply: 0.08)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          languageLayer.isArabic
                              ? 'اسم المشروع'
                              : 'Project name',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        context.addSpacer(multiply: 0.008),
                        const NormalTextFormFeild(
                          hintText: 'Clothes app',
                        ),
                        context.addSpacer(multiply: 0.008),
                        Text(
                          languageLayer.isArabic
                              ? 'اسم المعسكر'
                              : 'Boot-Camp Name',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        context.addSpacer(multiply: 0.008),
                        const NormalTextFormFeild(
                          hintText: 'Flutter bootcamp',
                        ),
                        context.addSpacer(multiply: 0.02),
                        const DateRow(),
                        context.addSpacer(multiply: 0.02),
                        Text(
                          languageLayer.isArabic
                              ? 'وصف المشروع'
                              : 'Project Description',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        context.addSpacer(multiply: 0.008),
                        const NormalTextFormFeild(
                          hintText: 'Write Project Description',
                          minLines: 4,
                        ),
                        ImagesCoulmn(languageLayer: languageLayer),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              languageLayer.isArabic ? 'الروابط' : 'Links',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            const Divider(),
                            const NormalTextFormFeild(
                                hintText: 'https://github.com/example'),
                            context.addSpacer(multiply: 0.008),
                            const NormalTextFormFeild(
                                hintText: '"https://figma.com/example"'),
                            context.addSpacer(multiply: 0.008),
                            const NormalTextFormFeild(
                                hintText: 'https://github.com/example'),
                            context.addSpacer(multiply: 0.008),
                            const NormalTextFormFeild(
                                hintText: '"https://figma.com/example"'),
                          ],
                        ),
                        context.addSpacer(multiply: 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              languageLayer.isArabic ? 'الاعضاء' : 'Members',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            const Divider(),
                            const Text(
                              'ID member',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            const NormalTextFormFeild(
                                hintText:
                                    '10545b55-4875-441d-88e8-f835acc72374')
                          ],
                        ),
                        context.addSpacer(multiply: 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'ID member',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Public',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                            )
                          ],
                        ),
                        const Divider(),
                        context.addSpacer(multiply: 0.02),
                        Center(
                          child: CustomButton(
                            englishTitle: 'Create',
                            arabicTitle: 'انشاء',
                            onPressed: () {},
                            arabic: languageLayer.isArabic,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_circle_down,
                color: Color(0xffA2A0A0),
              )
            ],
          ),
        );
      }),
    );
  }
}
