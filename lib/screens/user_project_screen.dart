import 'package:flutter/material.dart';

import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/widget/column/bootcamp_column.dart';
import 'package:tuwaiq_project/widget/container/project_container.dart';

class UserProjectScreen extends StatelessWidget {
  const UserProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = languageLocaitor.get<LanguageLayer>();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.addSpacer(),
          Text(
            language.isArabic ? 'مشاريعي' : 'My project',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(
            height: context.getHeight(multiply: 0.69),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              children: [
                 ProjectContainer(
                  projectName: 'Clothes app',
                  rate: '4.5',
                  bootcamp: 'Flutter bootcamp',
                  imagePath: 'assets/image/flutter.png',
                  onTap: (){},
                ),
                 ProjectContainer(
                  projectName: 'Clothes app',
                  rate: '4.5',
                  bootcamp: 'Flutter bootcamp',
                  imagePath: 'assets/image/data_science.png',
                  onTap: (){},
                ),
                 ProjectContainer(
                  projectName: 'Clothes app',
                  rate: '4.5',
                  bootcamp: 'Flutter bootcamp',
                  imagePath: 'assets/image/AI.png',
                  onTap: (){},
                ),
                 ProjectContainer(
                  projectName: 'Clothes app',
                  rate: '4.5',
                  bootcamp: 'Flutter bootcamp',
                  imagePath: 'assets/image/cyber.png',
                  onTap: (){},
                ),
                 ProjectContainer(
                  projectName: 'Clothes app',
                  rate: '4.5',
                  bootcamp: 'Flutter bootcamp',
                  imagePath: 'assets/image/flutter.png',
                  onTap: (){},
                ),
                 ProjectContainer(
                  projectName: 'Clothes app',
                  rate: '4.5',
                  bootcamp: 'Flutter bootcamp',
                  imagePath: 'assets/image/cyber.png',
                  onTap: (){},
                ),
              ],
            ),
          ),
          // Column(
          //   children: [
          //     Image.asset('assets/image/cyber.png'),
          //     const Text(
          //       'Cyber Security',
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
