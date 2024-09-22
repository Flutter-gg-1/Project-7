// ignore_for_file: unused_import

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_base.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_images.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_links.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_logo.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_members.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_presentation.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/row/date_row.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditScreen extends StatelessWidget {
  final String projectId;
  const EditScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<EditBloc>();
        bloc.projectId = projectId;
        var languageLayer = languageLocaitor.get<LanguageLayer>();
        return BlocListener<EditBloc, EditState>(
          listener: (context, state) {
            if (state is SucsessState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
            if (state is LoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
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
                        EditLogo(
                          bloc: bloc,
                          languageLayer: languageLayer,
                          projectId: projectId,
                        ),
                        EditBase(languageLayer: languageLayer, bloc: bloc),
                        EditPresentation(
                            bloc: bloc, languageLayer: languageLayer),
                        EditImages(bloc: bloc, languageLayer: languageLayer),
                        EditLinks(languageLayer: languageLayer, bloc: bloc),
                        EditMembers(
                          bloc: bloc,
                          languageLayer: languageLayer,
                        ),
                        BlocBuilder<EditBloc, EditState>(
                          builder: (context, state) {
                            return SingleChildScrollView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.getWidth(multiply: 0.08)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        languageLayer.isArabic
                                            ? 'تعديل الحالة'
                                            : 'Edit Status',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        '7 / 7 >',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  context.addSpacer(multiply: 0.025),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      languageLayer.isArabic
                                          ? 'تاريخ الانتهاء'
                                          : 'End date',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  NormalTextFormFeild(
                                    hintText: 'dd/mm/yyyy',
                                    controller: bloc.endDateController,
                                    keyboardType: TextInputType.datetime,
                                  ),
                                  context.addSpacer(multiply: 0.04),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Public',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      BlocBuilder<EditBloc, EditState>(
                                        builder: (context, state) {
                                          return Checkbox(
                                            value: state is PublicStatusState
                                                ? state.isPublic
                                                : bloc.isPublic,
                                            onChanged: (value) {
                                              bloc.add(IsPublicEvent(
                                                  isPublic: value!));
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Allow Editing',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      BlocBuilder<EditBloc, EditState>(
                                        builder: (context, state) {
                                          return Checkbox(
                                            value: state is EditStatusState
                                                ? state.isEdit
                                                : bloc.isEdit,
                                            onChanged: (value) {
                                              bloc.add(
                                                  IsEditEvent(isEdit: value!));
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Allow Rating',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      BlocBuilder<EditBloc, EditState>(
                                        builder: (context, state) {
                                          return Checkbox(
                                            value: state is RatingStatusState
                                                ? state.allowRating
                                                : bloc.allowRating,
                                            onChanged: (value) {
                                              bloc.add(AllowRatingEvent(
                                                  allowRating: value!));
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  context.addSpacer(multiply: 0.04),
                                  CustomButton(
                                      englishTitle: 'Create',
                                      arabicTitle: 'انشاء',
                                      arabic: languageLayer.isArabic,
                                      onPressed: () {
                                        bloc.add(ChangeStatusEvent(
                                            projectId: projectId));
                                      })
                                ],
                              ),
                            );
                          },
                        )
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
