import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class ProjectLinksColumn extends StatelessWidget {
  const ProjectLinksColumn({
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
          languageLayer.isArabic ? 'الروابط' : 'Links',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const Divider(),
        const NormalTextFormFeild(hintText: 'https://github.com/example'),
        context.addSpacer(multiply: 0.008),
        const NormalTextFormFeild(hintText: '"https://figma.com/example"'),
        context.addSpacer(multiply: 0.008),
        const NormalTextFormFeild(hintText: 'https://github.com/example'),
        context.addSpacer(multiply: 0.008),
        const NormalTextFormFeild(hintText: '"https://figma.com/example"'),
      ],
    );
  }
}
