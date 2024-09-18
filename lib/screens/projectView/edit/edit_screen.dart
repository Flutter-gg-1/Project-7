import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_base.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_logo.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/row/date_row.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<EditBloc>();

        var languageLayer = languageLocaitor.get<LanguageLayer>();
        return BlocListener<EditBloc, EditState>(
          listener: (context, state) {
            if (state is SucsessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(context.getWidth(multiply: 1),
                        context.getHeight(multiply: 0.1)),
                    painter: AuthShape(),
                  ),
                  context.addSpacer(),
                  Text(
                    languageLayer.isArabic
                        ? 'عدل على مشروعك'
                        : 'Edit your project',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  SizedBox(
                    height: context.getHeight(multiply: 0.75),
                    child: PageView(
                      children: [
                        EditLogo(bloc: bloc, languageLayer: languageLayer),
                        EditBase(languageLayer: languageLayer, bloc: bloc),
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getWidth(multiply: 0.1)),
                          child: BlocBuilder<EditBloc, EditState>(
                            builder: (context, state) {
                              Future<void> pickFile({
                                required EditEvent Function(File) createEvent,
                                required Function(File) updateFile,
                              }) async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                );
                                if (result != null) {
                                  final selectedFile =
                                      File(result.files.single.path!);
                                  updateFile(selectedFile);
                                  bloc.add(createEvent(selectedFile));
                                }
                              }

                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        languageLayer.isArabic
                                            ? 'تعديل العرض'
                                            : 'Edit Presentation',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        '3 / 6 >',
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
                                          languageLayer.isArabic
                                              ? 'ارفع العرض'
                                              : 'upload Presentation',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Text(
                                          ' *',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                  context.addSpacer(multiply: 0.008),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, bottom: 32),
                                      width: double.infinity,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffededed)),
                                      child: state is ProjectImagesState &&
                                              state.presentationFile != null
                                          ? Center(
                                              child: Text(state
                                                  .presentationFile!.path
                                                  .split('/')
                                                  .last))
                                          : IconButton(
                                              onPressed: () {
                                                pickFile(
                                                  createEvent: (file) =>
                                                      FilePickedEvent(
                                                          selectedFile: file),
                                                  updateFile: (p0) => {},
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 65,
                                                color: Color(0xff969696),
                                              ))),
                                  CustomButton(
                                    englishTitle: 'Edit Presentation',
                                    arabicTitle: 'تعديل العرض',
                                    onPressed: () {
                                      if (bloc.presentation != null) {
                                        bloc.add(ChangePresentationEvent());
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Upload file first')));
                                      }
                                    },
                                    arabic: languageLayer.isArabic,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const Text('Edit Project Images'),
                        const Text('Edit Project Links'),
                        const Text('Edit Project Members'),
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
