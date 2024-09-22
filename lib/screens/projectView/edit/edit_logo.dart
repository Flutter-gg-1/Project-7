import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';

class EditLogo extends StatelessWidget {
  const EditLogo({
    super.key,
    required this.bloc,
    required this.languageLayer,
    required this.projectId,
  });

  final EditBloc bloc;
  final LanguageLayer languageLayer;
  final String projectId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.1)),
      child: BlocBuilder<EditBloc, EditState>(
        builder: (context, state) {
          Future<void> pickImage({
            required EditEvent Function(File) createEvent,
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

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageLayer.isArabic ? 'تعديل الشعار' : 'Edit logo',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '1 / 7 >',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              context.addSpacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      languageLayer.isArabic ? 'الشعار' : 'upload Logo',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      ' *',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    )
                  ],
                ),
              ),
              context.addSpacer(multiply: 0.008),
              Container(
                  margin: const EdgeInsets.only(top: 7, bottom: 32),
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffededed)),
                  child: state is ProjectImagesState && state.logoImage != null
                      ? Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Image.file(state.logoImage!),
                            Positioned(
                              left: context.getWidth(multiply: 0.68),
                              bottom: context.getHeight(multiply: 0.1),
                              child: IconButton(
                                  onPressed: () {
                                    bloc.logoImage = null;
                                    bloc.add(DefaultEvent());
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ],
                        )
                      : IconButton(
                          onPressed: () {
                            pickImage(
                              createEvent: (image) =>
                                  LogoImageChangeEvent(selectedImage: image),
                              updateImage: (p0) => {},
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 65,
                            color: Color(0xff969696),
                          ))),
              CustomButton(
                englishTitle: 'Edit Logo',
                arabicTitle: 'تعديل الشعار',
                onPressed: () {
                  bloc.add(ChangeLogoEvent());
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
