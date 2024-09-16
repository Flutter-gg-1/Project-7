import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

import '../text/custom_text.dart';

class CustomTeamMemberCard extends StatelessWidget {
  const CustomTeamMemberCard({super.key, this.image, required this.name, required this.position, required this.description});
  final Widget? image;
  final String name;
  final String position;
  final String description;
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
                  leading: ClipOval(
                    child: image,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        children: [
                           CustomText(
                            text:
                                description,
                            size: 12,
                            color: Color(0xff848484),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                SimpleIcons.github,
                                color: Color(0xff848484),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const ClipOval(
                                child: Icon(
                                  SimpleIcons.linkedin,
                                  size: 24,
                                  color: Color(0xff848484),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const CircleAvatar(
                                minRadius: 12,
                                maxRadius: 12,
                                backgroundColor: Color(0xff848484),
                                foregroundColor: Colors.white,
                                child: Icon(
                                  Icons.email,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              CircleAvatar(
                                minRadius: 12,
                                maxRadius: 12,
                                backgroundColor: const Color(0xff848484),
                                child: Image.asset(
                                  "assets/images/CV_icon.png",
                                  scale: 1,
                                ),
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