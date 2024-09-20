import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/screens/home_screen/cubit/home_cubit.dart';
import 'package:project_judge/setup/init_setup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..checkCurrentUser(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Home_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        "Hello, ${getIt.get<DataLayer>().userInfo?.firstName}!",
                                    size: 32,
                                    color: const Color(0xffffffff),
                                  ),
                                  const CustomText(
                                    text:
                                        "Share, browse, and rate bootcamp projects!",
                                    size: 16,
                                    color: Color(0xffC4C4C4),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/images/defualt_img.png",
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff57E3D8),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: "Showcase Your Work",
                                  weight: FontWeight.w500,
                                  size: 24,
                                  color: Color(0xff5030B6),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const CustomText(
                                  text: "Check Out and Update Your projects ",
                                  size: 16,
                                  color: Color(0xff5030B6),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        backgroundColor:
                                            const Color(0xffffffff),
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width,
                                            63)),
                                    onPressed: () {
                                      //push to my projects
                                    },
                                    child: const Center(
                                      child: Text(
                                        "See Your Projects",
                                        style: TextStyle(
                                            color: Color(0xff4F2AB8),
                                            fontSize: 20),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const CustomText(
                          text: "Explore Projects",
                          weight: FontWeight.w500,
                          size: 24,
                          color: Color(0xffffffff),
                        ),
                        const SizedBox(height: 10),
                      ]),
                ),
                const CustomProjectsList(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color(0xffffffff),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 63)),
                      onPressed: () {
                        //push to browse
                      },
                      child: const Center(
                        child: Text(
                          "Browse All Projects",
                          style:
                              TextStyle(color: Color(0xff4F2AB8), fontSize: 20),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProjectsList extends StatelessWidget {
  const CustomProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 20,
          ),
          CustomProjectCard(
            img: null,
            projectName: "Long Project Name",
            bootcampName: "bootcamp name",
          ),
          SizedBox(width: 10),
          CustomProjectCard(
            img: null,
            projectName: "Long Project Name",
            bootcampName: "bootcamp name",
          ),
          SizedBox(width: 10),
          CustomProjectCard(
            img: null,
            projectName: "Long Project Name",
            bootcampName: "bootcamp name",
          ),
          SizedBox(width: 10),
          CustomProjectCard(
            img: null,
            projectName: "Long Project Name",
            bootcampName: "bootcamp name",
          ),
          SizedBox(width: 10),
          CustomProjectCard(
            img: null,
            projectName: "Long Project Name",
            bootcampName: "bootcamp name",
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomProjectCard extends StatelessWidget {
  CustomProjectCard({
    super.key,
    required this.img,
    required this.projectName,
    required this.bootcampName,
    //required this.stars
  });
  String? img;
  final String projectName;
  final String bootcampName;
  // final stars; NEED THE CUSTOM WIDGET FOR THIS !!!!!!!!
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff4E2EB5),
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                img ?? "assets/images/defualt_img.png",
                // fit: BoxFit.cover, // PUT A COND HERE TO VIEW DEAFULT IF NO IMAGE IS STORED !!!!!!!!
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'Long Project Name',
              size: 16,
              color: Color(0xff4D2EB4),
              allowOverflow: true,
            ),
            const CustomText(
              text: "Bootcamp name",
              size: 12,
              color: Color(0xffC4C4C4),
            ),
          ],
        ),
      ),
    );
  }
}
