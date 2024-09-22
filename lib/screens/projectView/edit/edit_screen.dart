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
import 'package:tuwaiq_project/screens/projectView/edit/edit_status.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/row/date_row.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditScreen extends StatelessWidget {
  final String projectId;
  final bool isAuthraize;
  const EditScreen(
      {super.key, required this.projectId, required this.isAuthraize});

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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
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
            floatingActionButton: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4D2EB4)),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  languageLayer.isArabic ? 'تم' : 'Done',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
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
                        EditStatus(
                          languageLayer: languageLayer,
                          bloc: bloc,
                          projectId: projectId,
                          isAuthraize: isAuthraize,
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
