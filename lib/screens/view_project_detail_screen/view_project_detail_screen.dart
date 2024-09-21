import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_judge/components/list_tiles/custom_project_detail_list_tile.dart';
import 'package:project_judge/components/text/custom_text.dart';
import "package:simple_icons/simple_icons.dart";
import '../../components/app_bar/custom_app_bar.dart';
import '../../components/buttons/custom_icon_button.dart';
import '../../components/cards/custom_team_member_card.dart';
import '../../components/containers/custom_slider_containers.dart';
import '../../components/custom_paints/bottom_navigation.dart';
import '../../components/custom_paints/tuwaiq_logo_paint.dart';
import '../../components/icons/custom_rate_icon.dart';

class ViewProjectDetailScreen extends StatelessWidget {
  const ViewProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Project Details',
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2.42,
            bottom: 10,
            child: CustomIconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/svg/bracode_icon.svg")),
          ),
          CustomPaint(
            size: const Size(390, 48),
            painter: bottomNavigationCustomPaint(),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 70,
                top: -40,
                child: CustomPaint(
                  size: const Size(295, 219),
                  painter: TuwaiqLogoCustomPaint(),
                ),
              ),
              CustomProjectDetailListTile(
                title: "Lorem ipsum dolor",
                type: "App",
                bootcampName: "Flutter Bootcamp",
                leading: Image.asset(
                  "assets/images/projectLogo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          CarouselSlider(
              items: [
                CustomSliderContainers(
                  image: Image.asset("assets/images/projectLogo.png"),
                ),
                CustomSliderContainers(
                  image: Image.asset("assets/images/projectLogo.png"),
                ),
                CustomSliderContainers(
                  image: Image.asset("assets/images/projectLogo.png"),
                )
              ],
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
              )),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  icon: const Icon(
                    SimpleIcons.github,
                    color: Colors.black,
                  ),
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/svg/figma_icon.svg",
                    width: 28,
                    height: 28,
                  ),
                ),
                CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      SimpleIcons.youtube,
                      color: Colors.red,
                    )),
                CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      SimpleIcons.pinterest,
                      color: Color.fromARGB(255, 193, 47, 37),
                    )),
                CustomIconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/svg/playstore_icon.svg",
                    width: 22,
                    height: 22,
                  ),
                ),
                CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      SimpleIcons.appstore,
                      color: Colors.blue,
                    )),
                CustomIconButton(
                  onPressed: () {},
                  icon: const Icon(
                    SimpleIcons.android,
                    color: Colors.green,
                  ),
                ),
                CustomIconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/web_icon.png"))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "2024 Aug - 2024 Aug ",
                  size: 12,
                  color: Color(0xff262626),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    CustomText( text: "4.7/5", size: 16),
                    SizedBox(
                      width: 14,
                    ),
                    CustomRateIcon(),
                    CustomRateIcon(),
                    CustomRateIcon(),
                    CustomRateIcon(),
                    CustomRateIcon(),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: const Color(0xff848484).withOpacity(0.5848484),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "About", size: 20),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Ultrices ut at nullam quis elit nec bibendum. Tristique amet pellentesque quis at non imperdiet. Feugiat lectus sed vel lacus dictum morbi sed ullamcorper in. Vel at lorem facilisi malesuada morbi. Proin sit enim sed id erat semper in turpis elementum. Eu in adipiscing ut curabitur. Leo morbi adipiscing facilisi sit arcu turpis vitae. Elementum auctor massa aliquam sed tristique pellentesque felis fermentum. Semper lacinia lobortis dictumst aliquet accumsan nisl eget auctor. Hac pellentesque iaculis enim libero pellentesque ipsum. Id leo non interdum elementum elementum felis at. Est metus amet amet enim maecenas cursus facilisis vitae diam. ",
                  size: 12,
                  color: Color(0xff848484),
                ),
              ],
            ),
          ),
          Divider(
            color: const Color(0xff848484).withOpacity(0.5848484),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: "Presentation", size: 20),
                TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      text:
                          "You can view the project presentation by clicking here",
                      color: Color(0xff59E2DB),
                      size: 12,
                    )),
              ],
            ),
          ),
          Divider(
            color: const Color(0xff848484).withOpacity(0.5848484),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: "Team members", size: 20),
                const SizedBox(
                  height: 20,
                ),
                CustomTeamMemberCard(
                  name: 'Name',
                  position: 'Position',
                  description:
                      'Lorem ipsum dolor sit amet consectetur. Sagittis porta dictumst nisl mi.',
                  image: Image.asset("assets/images/projectLogo.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTeamMemberCard(
                  name: 'Name',
                  position: 'Position',
                  description:
                      'Lorem ipsum dolor sit amet consectetur. Sagittis porta dictumst nisl mi.',
                  image: Image.asset("assets/images/projectLogo.png"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
