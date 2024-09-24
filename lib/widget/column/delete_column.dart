import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/bloc/project_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class DeleteColumn extends StatelessWidget {
  const DeleteColumn({
    super.key,
    required this.bloc,
    required this.languageLayer,
  });

  final ProjectBloc bloc;
  final LanguageLayer languageLayer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Option : Delete',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            )),
        context.addSpacer(multiply: 0.01),
        NormalTextFormFeild(
          hintText: 'Enter project ID',
          controller: bloc.projectIdController,
        ),
        context.addSpacer(multiply: 0.04),
        CustomButton(
            englishTitle: 'Delete',
            arabicTitle: 'حذف',
            arabic: languageLayer.isArabic,
            color: const Color(0xffE12727).withOpacity(0.81),
            onPressed: () {
              bloc.add(DeleteProjectEvent());
            })
      ],
    );
  }
}
