import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class ProjectMembersColumn extends StatelessWidget {
  const ProjectMembersColumn({
    super.key,
    required this.languageLayer,
  });

  final LanguageLayer languageLayer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageLayer.isArabic ? 'الاعضاء' : 'Members',
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const Divider(),
        const Text(
          'ID member',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const NormalTextFormFeild(
            hintText:
                '10545b55-4875-441d-88e8-f835acc72374')
      ],
    );
  }
}
