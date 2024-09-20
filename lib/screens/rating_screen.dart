import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/custome_rating_star.dart';
import 'package:tuwaiq_project/widget/project_view_widget/costumr_details_project.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              size: Size(context.getWidth(multiply: 3),
                  context.getHeight(multiply: 0.1)),
              painter: AuthShape(),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: context.getHeight(multiply: 0.18),
                  width: context.getWidth(multiply: 0.3),
                  decoration: const BoxDecoration(
                      color: Color(0xffCACACA), shape: BoxShape.circle),
                  child: Image.asset('assets/image/Search-amico(1).png'),
                ),
                CostomeDetailsProject(
                  readOnly: true,
                  maxHeight: context.getHeight(multiply: 0.13),
                  titleText: 'details project',
                  heightContainer: context.getHeight(multiply: 0.22),
                  widthContainer: context.getWidth(multiply: 0.6),
                  cotentText:
                      'sdkljsdjlskdsvkjls;dfldl;dkf;lsdkdlkfsdjfkldsjfsdhfkjsdhfkjsdfhkjsdhfkjdhkfhsjkdskfbsjkdfbksjdfbsjdkvsdjvbsjdkvbjksdbvjksdbvjksdbkjvbsdjkvbsjkdbvjkdbvjksdbvkjsdbvkjsdbkvjsdvjsdnvksdjbvsjdkvbkjbdbvkjsdbvkjsdbvjskdjvbjdsnclk',
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            CustomeRatingStar(
              onRatingUpdate: (rating) {},
              horizontalStar: context.getWidth(multiply: 0.04),
              titleText: 'IDEA',
              itemCount: 5,
              itemSize: context.getWidth(multiply: 0.1),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            CustomeRatingStar(
              onRatingUpdate: (rating) {},
              horizontalStar: context.getWidth(multiply: 0.04),
              titleText: 'DESIGN',
              itemCount: 5,
              itemSize: context.getWidth(multiply: 0.1),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            CustomeRatingStar(
              onRatingUpdate: (rating) {},
              horizontalStar: context.getWidth(multiply: 0.04),
              titleText: 'TOOLS',
              itemCount: 5,
              itemSize: context.getWidth(multiply: 0.1),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            CustomeRatingStar(
              onRatingUpdate: (rating) {},
              horizontalStar: context.getWidth(multiply: 0.04),
              titleText: 'PRACTICES',
              itemCount: 5,
              itemSize: context.getWidth(multiply: 0.1),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            CustomeRatingStar(
              onRatingUpdate: (rating) {},
              horizontalStar: context.getWidth(multiply: 0.04),
              titleText: 'PRESENTATION',
              itemCount: 5,
              itemSize: context.getWidth(multiply: 0.1),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            CustomeRatingStar(
              onRatingUpdate: (rating) {},
              horizontalStar: context.getWidth(multiply: 0.04),
              titleText: 'INVESTMENT',
              itemCount: 5,
              itemSize: context.getWidth(multiply: 0.1),
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.02),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: context.getWidth(multiply: 0.06)),
                    child: const Text(
                      'NOTE',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                CostomeDetailsProject(
                  readOnly: true,
                  maxHeight: context.getHeight(multiply: 0.14),
                  heightContainer: context.getHeight(multiply: 0.22),
                  widthContainer: context.getWidth(multiply: 0.9),
                  cotentText:
                      'sdkljsdjlskdsvkjls;dfldl;dkf;lsdkdlkfsdjfkldsjfsdhfkjsdhfkjsdfhkjsdhfkjdhkfhsjkdskfbsjkdfbksjdfbsjdkvsdjvbsjdkvbjksdbvjksdbvjksdbkjvbsdjkvbsjkdbvjkdbvjksdbvkjsdbvkjsdbkvjsdvjsdnvksdjbvsjdkvbkjbdbvkjsdbvkjsdbvjskdjvbjdsnclk',
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight(multiply: 0.03),
            ),
          ],
        ),
      )),
    );
  }
}
