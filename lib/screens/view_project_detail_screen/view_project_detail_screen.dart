
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_judge/components/list_tiles/custom_project_detail_list_tile.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/view_project_detail_screen/cubit/view_project_details_cubit.dart';
import 'package:project_judge/setup/init_setup.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../components/app_bar/custom_app_bar.dart';
import '../../components/buttons/custom_icon_button.dart';
import '../../components/cards/custom_team_member_card.dart';
import '../../components/containers/custom_slider_containers.dart';
import '../../components/custom_paints/bottom_navigation.dart';
import '../../components/custom_paints/tuwaiq_logo_paint.dart';
import '../../components/icons/custom_rate_icon.dart';
import '../../data_layer/data_layer.dart';

class ViewProjectDetailScreen extends StatelessWidget {
  const ViewProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewProjectDetailsCubit()..loadProjectDetail(),
      child: Scaffold(
        appBar: const CustomAppBar(
          text: 'Project Details',
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 38,
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
        body: BlocBuilder<ViewProjectDetailsCubit, ViewProjectDetailsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is ErrorState) {
              return Center(
                child: Text(state.msg),
              );
            }
            if (state is SuccessState) {
              final projectDetail = getIt.get<DataLayer>().projectInfo;
              if (projectDetail == null) {
                return const Center(child: Text("Project details not found."));
              }
              return ListView(
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
                        title: projectDetail[0].projectName ?? "null",
                        type: "${projectDetail[0].type}",
                        bootcampName: projectDetail[0].bootcampName ?? 'null',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              "${projectDetail[0].startDate}-${projectDetail[0].endDate}",
                          size: 12,
                          color: const Color(0xff262626),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: "${projectDetail[0].rating}", size: 16),
                            const SizedBox(
                              width: 14,
                            ),
                            const CustomRateIcon(),
                            const CustomRateIcon(),
                            const CustomRateIcon(),
                            const CustomRateIcon(),
                            const CustomRateIcon(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: const Color(0xff848484).withOpacity(0.5848484),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: "About", size: 20),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text: projectDetail[0].projectDescription ?? "null",
                          size: 12,
                          color: const Color(0xff848484),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: const Color(0xff848484).withOpacity(0.5848484),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: "Team members", size: 20),
                        const SizedBox(
                          height: 20,
                        ),
                         if (projectDetail[0].membersProject!.isNotEmpty) ...projectDetail[0].membersProject!.map((member) {
        return CustomTeamMemberCard(
          name: "${member.firstName}",
          position: "${member.position}",
          description: 'Lorem ipsum dolor sit amet consectetur.',
        );
      })
      else ...[
        ///////// ): why?
        const CustomText(text: "No team members found.", size: 16),
      ],
      ///////////////////   
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
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
