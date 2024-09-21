import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/screens/project_info/cubit/project_info_cubit.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/project_view_widget/costumr_details_project.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_carousel_slider.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_member_of_project.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_status_project.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_top_action.dart';

class ProjectViewScreen extends StatelessWidget {
  const ProjectViewScreen({super.key, required this.projectsModel});

  final ProjectsModel projectsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectInfoCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<ProjectInfoCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                CustomPaint(
                  size: Size(context.getWidth(multiply: 1),
                      context.getHeight(multiply: 0.1)),
                  painter: AuthShape(),
                ),
                CustomeActionProject(
                  editClick: () {},
                  qrCodeButton: () {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: Container(
                          width: context.getWidth(multiply: 0.8),
                          height: context.getHeight(multiply: 0.4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              const Text('Rate me'),
                              QrImageView(
                                backgroundColor: Colors.white,
                                data: projectsModel.projectId!,
                                padding: EdgeInsets.zero,
                                version: QrVersions.auto,
                                size: context.getHeight(multiply: 0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  height: context.getHeight(multiply: 0.2),
                  width: context.getWidth(multiply: 0.3),
                  decoration: const BoxDecoration(
                      color: Color(0xffCACACA), shape: BoxShape.circle),
                  child: Image.asset('assets/image/Search-amico(1).png'),
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.02),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomeCampStatusProject(
                      continaerColor: const Color(0xffBB88FC).withOpacity(0.30),
                      borderColor: const Color(0xffBB88FC).withOpacity(0.30),
                      textContent: projectsModel.projectName ?? "no name",
                      heightContainer: context.getHeight(multiply: 0.043),
                      widthContainer: context.getWidth(multiply: 0.25),
                      sizeText: 16,
                    ),
                    projectsModel.allowEdit == true
                        ? CustomeCampStatusProject(
                            continaerColor:
                                const Color(0xff00FF19).withOpacity(0.30),
                            borderColor:
                                const Color(0xff00FF19).withOpacity(0.30),
                            textContent: 'OnGoing',
                            heightContainer: context.getHeight(multiply: 0.043),
                            widthContainer: context.getWidth(multiply: 0.25),
                            sizeText: 16,
                          )
                        : CustomeCampStatusProject(
                            continaerColor:
                                const Color(0xffFF0000).withOpacity(0.30),
                            borderColor:
                                const Color(0xffFF0000).withOpacity(0.30),
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
                CostomeDetailsProject(
                  maxHeight: context.getHeight(multiply: 0.1),
                  readOnly: true,
                  heightContainer: context.getHeight(multiply: 0.3),
                  widthContainer: context.getWidth(multiply: 0.8),
                  cotentText: projectsModel.projectDescription ?? "nothing",
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.035),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomeCampStatusProject(
                      titleTextContainer: 'Start Date',
                      continaerColor: const Color(0xff00FF19).withOpacity(0.30),
                      borderColor: const Color(0xff00FF19).withOpacity(0.30),
                      textContent: projectsModel.startDate ?? "not giveing",
                      heightContainer: context.getHeight(multiply: 0.043),
                      widthContainer: context.getWidth(multiply: 0.25),
                      sizeText: 16,
                    ),
                    CustomeCampStatusProject(
                      titleTextContainer: 'End Date',
                      continaerColor: const Color(0xffFF0000).withOpacity(0.30),
                      borderColor: const Color(0xffFF0000).withOpacity(0.30),
                      textContent: projectsModel.endDate ?? "not giveing",
                      heightContainer: context.getHeight(multiply: 0.043),
                      widthContainer: context.getWidth(multiply: 0.25),
                      sizeText: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.035),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Project Images',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                BlocBuilder<ProjectInfoCubit, ProjectInfoState>(
                  builder: (context, state) {
                    if (state is ImgChangeState) {
                      return CarouselSliderCustome(
                        carouselSliderWidget: projectsModel.imagesProject,
                        currentIndex: state.imgIndex,
                        onPageChanged: (p0, p1) {
                          cubit.onImgChange(imgIndex: p0);
                        },
                      );
                    }

                    return CarouselSliderCustome(
                      carouselSliderWidget: projectsModel.imagesProject,
                      currentIndex: 0,
                      onPageChanged: (p0, p1) {
                        cubit.onImgChange(imgIndex: p0);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.035),
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: context.getWidth(multiply: 0.095)),
                      padding: EdgeInsets.symmetric(
                          horizontal: context.getWidth(multiply: 0.015),
                          vertical: context.getWidth(multiply: 0.03)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 196, 196, 196),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0.5, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Presentation',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          CustomeCampStatusProject(
                            titleSize: 0,
                            continaerColor:
                                const Color(0xff00FF19).withOpacity(0.30),
                            borderColor:
                                const Color(0xff00FF19).withOpacity(0.30),
                            textContent:
                                projectsModel.presentationDate ?? "not giveing",
                            heightContainer: context.getHeight(multiply: 0.043),
                            widthContainer: context.getWidth(multiply: 0.25),
                            sizeText: 16,
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: context.getWidth(multiply: 0.06),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.035),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Project Links',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  spacing: context.getWidth(multiply: 0.02),
                  runSpacing: context.getHeight(multiply: 0.02),
                  children: List.generate(
                    projectsModel.linksProject.length,
                    (index) {
                      return Container(
                        width: context.getWidth(multiply: 0.2),
                        height: context.getHeight(multiply: 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(255, 253, 253, 253)
                              .withOpacity(0.70),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 196, 196, 196),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0.5, 2),
                            ),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              // here show up the url that the user when click will move him to website
                              // projectsModel.linksProject[index].type;
                            },
                            child:
                                Text(projectsModel.linksProject[index].type)),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.035),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Project Team',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.035),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getWidth(multiply: 0.05)),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.56,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: projectsModel.membersProject.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: context.getWidth(multiply: 2),
                      child: CustomeMemberContainer(
                        membersProject: projectsModel.membersProject[index],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.15),
                ),
                SizedBox(
                  height: context.getHeight(multiply: 0.04),
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
