import 'package:flutter/material.dart';
import 'package:project_judge/components/text/custom_text.dart';

class CustomProjectDetailListTile extends StatelessWidget {
  const CustomProjectDetailListTile({super.key, this.leading, required this.title, required this.type, required this.bootcampName});
  final Widget? leading;
  final String title;
  final String type;
  final String bootcampName;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ListTile(
                  leading: leading,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: bootcampName,
                        size: 12,
                        color: const Color(0xff848484),
                      ),
                      CustomText(
                        text: title,
                        size: 24,
                        color: const Color(0xff262626),
                      ),
                      CustomText(
                        text: type,
                        size: 12,
                        color: const Color(0xff848484),
                      ),
                    ],
                  ),
                ),
              );
  }
}