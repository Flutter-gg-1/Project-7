import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/models/projects_model.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_status_project.dart';

class InfoCoulmn extends StatelessWidget {
  const InfoCoulmn({
    super.key,
    required this.language,
    required this.projectsModel,
  });

  final LanguageLayer language;
  final ProjectsModel projectsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeCampStatusProject(
              titleTextContainer: language.isArabic ? 'المعسكر' : 'BootCamp',
              continaerColor: const Color(0xffBB88FC).withOpacity(0.30),
              borderColor: const Color(0xffBB88FC).withOpacity(0.30),
              textContent: projectsModel.projectName ?? "no name",
              heightContainer: context.getHeight(multiply: 0.043),
              widthContainer: context.getWidth(multiply: 0.25),
              sizeText: 16,
            ),
            projectsModel.allowEdit == true
                ? CustomeCampStatusProject(
                    titleTextContainer:
                        language.isArabic ? 'حالة المشروع' : 'Project Status',
                    continaerColor: const Color(0xff00FF19).withOpacity(0.30),
                    borderColor: const Color(0xff00FF19).withOpacity(0.30),
                    textContent: language.isArabic ? 'ساري' : 'OnGoing',
                    heightContainer: context.getHeight(multiply: 0.043),
                    widthContainer: context.getWidth(multiply: 0.25),
                    sizeText: 16,
                  )
                : CustomeCampStatusProject(
                    continaerColor: const Color(0xffFF0000).withOpacity(0.30),
                    borderColor: const Color(0xffFF0000).withOpacity(0.30),
                    textContent: 'close',
                    heightContainer: context.getHeight(multiply: 0.043),
                    widthContainer: context.getWidth(multiply: 0.25),
                    sizeText: 16,
                  ),
          ],
        ),
        SizedBox(
          height: context.getHeight(multiply: 0.035),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeCampStatusProject(
              titleTextContainer: language.isArabic ? 'المعسكر' : 'BootCamp',
              continaerColor: const Color(0xffBB88FC).withOpacity(0.30),
              borderColor: const Color(0xffBB88FC).withOpacity(0.30),
              textContent: projectsModel.bootcampName ?? "No name",
              heightContainer: context.getHeight(multiply: 0.043),
              widthContainer: context.getWidth(multiply: 0.25),
              sizeText: 16,
            ),
            CustomeCampStatusProject(
              titleTextContainer:
                  language.isArabic ? 'نوع المشروع' : 'Project type',
              continaerColor: const Color(0xff00FF19).withOpacity(0.30),
              borderColor: const Color(0xff00FF19).withOpacity(0.30),
              textContent: projectsModel.type ?? 'no type',
              heightContainer: context.getHeight(multiply: 0.043),
              widthContainer: context.getWidth(multiply: 0.25),
              sizeText: 16,
            )
          ],
        ),
        SizedBox(
          height: context.getHeight(multiply: 0.035),
        ),
      ],
    );
  }
}
