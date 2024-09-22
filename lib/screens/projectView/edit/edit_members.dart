import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditMembers extends StatelessWidget {
  const EditMembers(
      {super.key, required this.languageLayer, required this.bloc});

  final LanguageLayer languageLayer;
  final EditBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.08)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                languageLayer.isArabic ? 'تعديل الروابط' : 'Edit members',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '6 / 7 >',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
          context.addSpacer(multiply: 0.025),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languageLayer.isArabic ? 'ID' : 'id members',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              context.addSpacer(multiply: 0.008),
              NormalTextFormFeild(
                hintText: 'ID',
                controller: bloc.memberIdController,
              ),
              context.addSpacer(multiply: 0.008),
              Text(
                languageLayer.isArabic ? 'المنصب' : 'members position',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              context.addSpacer(multiply: 0.008),
              NormalTextFormFeild(
                hintText: 'position',
                controller: bloc.memberPositionController,
              ),
              context.addSpacer(multiply: 0.008),
              BlocBuilder<EditBloc, EditState>(
                builder: (context, state) {
                  if (state is AddMembersState) {
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        children: List.generate(
                          state.names.length,
                          (index) {
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(state.names[index]),
                                  Text(state.position[index])
                                ]);
                          },
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
              context.addSpacer(multiply: 0.008),
            ],
          ),
          CustomButton(
            englishTitle: 'Add User',
            arabicTitle: 'اضافة مستخدم',
            onPressed: () {
              bloc.add(AddMembersEvent());
            },
            arabic: languageLayer.isArabic,
          ),
          CustomButton(
            englishTitle: 'Update',
            arabicTitle: 'تحديث',
            onPressed: () {
              bloc.add(ChangeMembersEvent());
            },
            arabic: languageLayer.isArabic,
          ),
        ],
      ),
    );
  }
}
