import 'dart:developer';
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
import 'package:tuwaiq_project/widget/column/project_links_column.dart';
import 'package:tuwaiq_project/widget/column/project_members_column.dart';
import 'package:tuwaiq_project/widget/row/date_row.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class ManageProjectScreen extends StatelessWidget {
  const ManageProjectScreen({super.key});

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
        return BlocListener<ProjectBloc, ProjectState>(
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
            body: Column(
              children: [
                CustomPaint(
                  size: Size(context.getWidth(multiply: 1),
                      context.getHeight(multiply: 0.1)),
                  painter: AuthShape(),
                ),
                context.addSpacer(),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getWidth(multiply: 0.1)),
                  child: Column(
                    children: [
                      const Text(
                        'Manage project',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Option : Create',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )),
                      NormalTextFormFeild(
                        hintText: 'Enter user ID',
                        controller: bloc.userIdController,
                      ),
                      context.addSpacer(multiply: 0.04),
                      NormalTextFormFeild(
                        hintText: 'dd/mm/yyyy',
                        controller: bloc.endDateController,
                        keyboardType: TextInputType.datetime,
                      ),
                      context.addSpacer(multiply: 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Allow Editing',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<ProjectBloc, ProjectState>(
                            builder: (context, state) {
                              return Checkbox(
                                value: state is EditChangeState
                                    ? state.isEdit
                                    : bloc.isEdit,
                                onChanged: (value) {
                                  bloc.add(IsEditEvent(isEdit: value!));
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
                            bloc.add(CreateProjectEvent());
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
