import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/custom_icon_button.dart';
import 'package:simple_icons/simple_icons.dart';

import '../text/custom_text.dart';

class CustomTeamMemberCard extends StatelessWidget {
  const CustomTeamMemberCard(
      {super.key,
      this.image,
      required this.name,
      required this.position,
      required this.description,
      this.githubOnPressed,
      this.linkedinOnPressed,
      this.bindLinkOnPressed,
      this.cvOnPressed});
  final Widget? image;
  final String name;
  final String position;
  final String description;
  final Function()? githubOnPressed;
  final Function()? linkedinOnPressed;
  final Function()? bindLinkOnPressed;
  final Function()? cvOnPressed;
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: ClipOval(
          child: image,
        ),
      ),
      title: CustomText(
        text: name,
        size: 16,
        color: const Color(0xff262626),
      ),
      subtitle: CustomText(
        text: position,
        size: 12,
      ),
      borderRadius: BorderRadius.circular(17),
      shadowColor: Colors.grey,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              CustomText(
                text: description,
                size: 12,
                color: const Color(0xff848484),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CustomIconButton(
                      onPressed: githubOnPressed,
                      icon: const Icon(
                        SimpleIcons.github,
                        color: Colors.black,
                      )),
                  CustomIconButton(
                    onPressed: linkedinOnPressed,
                    icon: const ClipOval(
                        child: Icon(
                      SimpleIcons.linkedin,
                      size: 24,
                      color: Color.fromARGB(255, 40, 70, 180),
                    )),
                  ),
                  CustomIconButton(
                    onPressed: bindLinkOnPressed,
                    icon: const CircleAvatar(
                        minRadius: 12,
                        maxRadius: 12,
                        backgroundColor: Color(0xff848484),
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.link,
                          size: 18,
                        )),
                  ),
                  CustomIconButton(
                    onPressed: cvOnPressed,
                    icon: CircleAvatar(
                        minRadius: 12,
                        maxRadius: 12,
                        backgroundColor: const Color(0xff848484),
                        child: CustomIconButton(
                          icon: Image.asset(
                            "assets/images/CV_icon.png",
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
