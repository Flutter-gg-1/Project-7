// ignore_for_file: unused_import

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';

class EditImages extends StatelessWidget {
  const EditImages({
    super.key,
    required this.bloc,
    required this.languageLayer,
  });

  final EditBloc bloc;
  final LanguageLayer languageLayer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.1)),
      child: BlocBuilder<EditBloc, EditState>(
        builder: (context, state) {
          Future<void> pickImages({
            required EditEvent Function(List<File>) createEvent,
            required Function(List<File>) updateImages,
          }) async {
            final ImagePicker picker = ImagePicker();
            final List<XFile> images = await picker.pickMultiImage();
            if (images.isNotEmpty) {
              final selectedImages =
                  images.map((image) => File(image.path)).toList();
              updateImages(selectedImages);
              bloc.add(createEvent(selectedImages));
            }
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageLayer.isArabic ? 'تعديل الصور' : 'Edit images',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '4 / 7 >',
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
                      languageLayer.isArabic ? 'الشعار' : 'upload images',
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
                  child: state is ProjectImagesState &&
                          state.projectImage != null
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.projectImage!
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                      e,
                                      scale: 10,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            pickImages(
                              createEvent: (images) => ProjectImagesChangeEvent(
                                  selectedImages: images),
                              updateImages: (p0) => {},
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 65,
                            color: Color(0xff969696),
                          ))),
              CustomButton(
                englishTitle: 'Edit Images',
                arabicTitle: 'تعديل الصور',
                onPressed: () {
                  bloc.add(ChangeImagesEvent());
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
