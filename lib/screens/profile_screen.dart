import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/profile_information_screen.dart';
import 'package:tuwaiq_project/widget/links_profile/custome_links_profile.dart';
import 'package:tuwaiq_project/widget/links_profile/custome_title_text_profile.dart';
import 'package:tuwaiq_project/widget/list_tile/custome_listtile_profile.dart';
import 'package:tuwaiq_project/widget/status_profile/custome_status_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHeight(multiply: 0.035),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const ProfileInformationScreen();
                },
              ),
            );
          },
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: context.getHeight(multiply: 0.03),
                  vertical: context.getWidth(multiply: 0.03)),
              child: const ListTile(
                title: Text(
                  'Angelica Jackson',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Analyzer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6E7386),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/image/Search-amico(1).png'),
                ),
              )),
        ),
        SizedBox(
          height: context.getHeight(multiply: 0.035),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeStatusProfile(
              icon: Icon(
                Icons.library_books_rounded,
                size: context.getHeight(multiply: 0.05),
              ),
              rating: '1',
              textTitle: 'Projects',
            ),
            CustomeStatusProfile(
              textTitle: 'Rating',
              rating: '0',
              icon: Icon(
                Icons.star,
                size: context.getHeight(multiply: 0.05),
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.getHeight(multiply: 0.05),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeLinksProfile(
              iconLinks: const FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            CustomeLinksProfile(
              iconLinks: const FaIcon(
                FontAwesomeIcons.github,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            CustomeLinksProfile(
              iconLinks: const FaIcon(
                FontAwesomeIcons.discord,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            CustomeLinksProfile(
              text: 'CV',
              onTap: () {},
            ),
          ],
        ),
        const CustomeTitleText(
          title: 'More',
        ),
        SizedBox(height: context.getHeight(multiply: 0.01)),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: context.getWidth(multiply: 0.03)),
          padding: EdgeInsets.symmetric(
              horizontal: context.getWidth(multiply: 0.015),
              vertical: context.getWidth(multiply: 0.03)),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(213, 231, 231, 231).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0.5, 0.5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeListTileProfile(
                onTap: () {},
                iconListTile: Icon(
                  Icons.notifications_none_outlined,
                  size: context.getHeight(multiply: 0.035),
                  color: const Color(0xff0601B4).withOpacity(0.70),
                ),
                colorText: Colors.black,
                text: 'Help & Support',
              ),
              SizedBox(
                height: context.getHeight(multiply: 0.02),
              ),
              CustomeListTileProfile(
                onTap: () {},
                iconListTile: Icon(
                  Icons.notifications_none_outlined,
                  size: context.getHeight(multiply: 0.035),
                  color: const Color(0xff0601B4).withOpacity(0.70),
                ),
                colorText: Colors.black,
                text: 'About App',
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.getHeight(multiply: 0.02),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: context.getWidth(multiply: 0.03)),
          padding: EdgeInsets.symmetric(
              horizontal: context.getWidth(multiply: 0.015),
              vertical: context.getWidth(multiply: 0.03)),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(213, 231, 231, 231).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0.5, 0.5),
              ),
            ],
          ),
          child: CustomeListTileProfile(
            onTap: () {},
            iconListTile: Icon(
              Icons.logout_outlined,
              size: context.getHeight(multiply: 0.035),
              color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.70),
            ),
            colorText: const Color.fromARGB(255, 255, 0, 0),
            text: 'Logout',
          ),
        ),
      ],
    );
  }
}
