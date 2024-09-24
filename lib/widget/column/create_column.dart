import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/bloc/project_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class CreateColumn extends StatelessWidget {
  const CreateColumn({
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
              'Option : Create',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            )),
        context.addSpacer(multiply: 0.01),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
                return Checkbox(
                  value: state is EditStatusState ? state.isEdit : bloc.isEdit,
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
    );
  }
}
