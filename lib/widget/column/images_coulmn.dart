import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/bloc/project_bloc.dart';

class ImagesCoulmn extends StatelessWidget {
  const ImagesCoulmn({
    super.key,
    required this.languageLayer,
  });

  final LanguageLayer languageLayer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageLayer.isArabic ? 'الشعار' : 'Logo',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
                    ? Image.file(state.logoImage!)
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
            Text(
              languageLayer.isArabic ? 'العرض' : 'Presentation',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
                        state.presentationImage != null
                    ? Image.file(state.presentationImage!)
                    : IconButton(
                        onPressed: () {
                          pickImage(
                            createEvent: (image) =>
                                PresentationImageChangeEvent(
                                    selectedImage: image),
                            updateImage: (p0) => {},
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 65,
                          color: Color(0xff969696),
                        ))),
            Text(
              languageLayer.isArabic ? 'صور المشروع' : 'Images Project',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            context.addSpacer(multiply: 0.008),
            Container(
                margin: const EdgeInsets.only(top: 7, bottom: 32),
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffededed)),
                child: state is ProjectImagesState && state.projectImage != null
                    ? Image.file(state.projectImage!)
                    : IconButton(
                        onPressed: () {
                          pickImage(
                            createEvent: (image) =>
                                ProjectImageChangeEvent(selectedImage: image),
                            updateImage: (p0) => {},
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 65,
                          color: Color(0xff969696),
                        ))),
          ],
        );
      },
    );
  }
}
