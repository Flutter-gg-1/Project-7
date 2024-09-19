import 'package:flutter/material.dart';

import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/widget/column/bootcamp_column.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

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
            language.isArabic ? 'معسكرات طويق' : 'Tuwaiq BootCamp',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(
            height: context.getHeight(multiply: 0.65),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              children: [
                BootcampColumn(
                  imagePath: 'assets/image/cyber.png',
                  title: 'Cyber Security',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/flutter.png',
                  title: 'Flutter App Dev',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/data_science.png',
                  title: 'Data science',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/AI.png',
                  title: 'AI',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/AI.png',
                  title: 'AI',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/AI.png',
                  title: 'AI',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/AI.png',
                  title: 'AI',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/AI.png',
                  title: 'AI',
                  onTap: () {},
                ),
                BootcampColumn(
                  imagePath: 'assets/image/AI.png',
                  title: 'AI',
                  onTap: () {},
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
