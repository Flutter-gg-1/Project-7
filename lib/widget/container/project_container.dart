import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class ProjectContainer extends StatelessWidget {
  final Function()? onTap;
  final String imagePath, bootcamp, rate, projectName;
  const ProjectContainer({
    super.key,
    this.onTap,
    required this.bootcamp,
    required this.rate,
    required this.imagePath,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.01)),
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[4],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
            ),
            //Later make sure for responsive
             Row(
              children: [
                Text(
                  projectName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
                Text(
                  '$rate/5',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
             Text(
              bootcamp,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0x55000000)),
            )
          ],
        ),
      ),
    );
  }
}
