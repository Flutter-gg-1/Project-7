// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditStatus extends StatelessWidget {
  const EditStatus({
    super.key,
    required this.languageLayer,
    required this.bloc,
    required this.projectId,
    required this.isAuthraize,
  });

  final LanguageLayer languageLayer;
  final EditBloc bloc;
  final String projectId;
  final bool isAuthraize;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBloc, EditState>(
      builder: (context, state) {
        return isAuthraize
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: context.getWidth(multiply: 0.08)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          languageLayer.isArabic
                              ? 'تعديل الحالة'
                              : 'Edit Status',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                        languageLayer.isArabic ? 'تاريخ الانتهاء' : 'End date',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Public',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<EditBloc, EditState>(
                          builder: (context, state) {
                            return Checkbox(
                              value: state is PublicStatusState
                                  ? state.isPublic
                                  : bloc.isPublic,
                              onChanged: (value) {
                                bloc.add(IsPublicEvent(isPublic: value!));
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Allow Editing',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<EditBloc, EditState>(
                          builder: (context, state) {
                            return Checkbox(
                              value: state is EditStatusState
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Allow Rating',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<EditBloc, EditState>(
                          builder: (context, state) {
                            return Checkbox(
                              value: state is RatingStatusState
                                  ? state.allowRating
                                  : bloc.allowRating,
                              onChanged: (value) {
                                bloc.add(AllowRatingEvent(allowRating: value!));
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
                          bloc.add(ChangeStatusEvent(projectId: projectId));
                        })
                  ],
                ),
              )
            : Center(
                child: Text(
                  languageLayer.isArabic
                      ? 'ليس لديك الصلاحية'
                      : "You don't have acsses",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              );
      },
    );
  }
}
