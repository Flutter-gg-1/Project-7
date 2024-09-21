import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/project_view_widget/costumr_details_project.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_carousel_slider.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_member_of_project.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_status_project.dart';
import 'package:tuwaiq_project/widget/project_view_widget/custome_top_action.dart';

class ProjectViewScreen extends StatelessWidget {
  const ProjectViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              deleteClick: () {},
              editClick: () {},
              reviewClick: () {},
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
                  textContent: 'Flutter',
                  heightContainer: context.getHeight(multiply: 0.043),
                  widthContainer: context.getWidth(multiply: 0.25),
                  sizeText: 16,
                ),
                CustomeCampStatusProject(
                  continaerColor: const Color(0xff00FF19).withOpacity(0.30),
                  borderColor: const Color(0xff00FF19).withOpacity(0.30),
                  textContent: 'OnGoing',
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
              readOnly: true,
              titleText: 'details project',
              maxHeight: context.getHeight(multiply: 0.2),
              heightContainer: context.getHeight(multiply: 0.3),
              widthContainer: context.getWidth(multiply: 0.8),
              cotentText:
                  'sdkljsdjlskdjlfksnclksdnclksdnclnasxasxasasxsaxjbkasjcbsdbckjsdbjksvkjdbvkjsdbvkjsdbvjskdjvbjdskbvjdskbvkjsdbvkjdsbkjvdslkdnsdjnlsdnldsncnsdlcnldsnclk',
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
                  textContent: '2024-12-15',
                  heightContainer: context.getHeight(multiply: 0.043),
                  widthContainer: context.getWidth(multiply: 0.25),
                  sizeText: 16,
                ),
                CustomeCampStatusProject(
                  titleTextContainer: 'End Date',
                  continaerColor: const Color(0xffFF0000).withOpacity(0.30),
                  borderColor: const Color(0xffFF0000).withOpacity(0.30),
                  textContent: '2024-12-15',
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
            //statful
            CarouselSliderCustome(
              currentIndex: 0,
              onPageChanged: (p0, p1) {},
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
                        borderColor: const Color(0xff00FF19).withOpacity(0.30),
                        textContent: '2024-12-15',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                  child:
                      TextButton(onPressed: () {}, child: const Text('Figma')),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomeMemberContainer(
                  img: Image.asset('assets/image/Search-amico(1).png'),
                  name: 'anas',
                  positions: 'UI',
                ),
                CustomeMemberContainer(
                  img: Image.asset('assets/image/Search-amico(1).png'),
                  name: 'ammar',
                  positions: 'dev',
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.024),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomeMemberContainer(
                  img: Image.asset('assets/image/Search-amico(1).png'),
                  name: 'basel',
                  positions: 'dev',
                ),
                CustomeMemberContainer(
                  img: Image.asset('assets/image/Search-amico(1).png'),
                  name: 'fahad',
                  positions: 'UI',
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.04),
            ),
          ],
        ),
      )),
    );
  }
}
