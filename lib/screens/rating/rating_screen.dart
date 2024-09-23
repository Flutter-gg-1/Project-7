// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/home_screen.dart';
import 'package:tuwaiq_project/screens/rating/bloc/rating_bloc.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/custome_rating_star.dart';
import 'package:tuwaiq_project/widget/project_view_widget/costumr_details_project.dart';

class RatingScreen extends StatelessWidget {
  RatingScreen({super.key, required this.projectId});
  final language = languageLocaitor.get<LanguageLayer>();
  final String projectId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingBloc(),
      child: BlocListener<RatingBloc, RatingState>(
        listener: (context, state) async {
          if (state is LoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }
          if (state is SucsessState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: Container(
                  width: context.getWidth(multiply: 0.4),
                  height: context.getHeight(multiply: 0.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      state.msg,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
            await Future.delayed(const Duration(seconds: 2));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (route) => false,
            );
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Builder(builder: (context) {
          final bloc = context.read<RatingBloc>();
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
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
                        titleText: language.isArabic
                            ? 'وصف المشروع'
                            : 'Project details',
                        heightContainer: context.getHeight(multiply: 0.22),
                        widthContainer: context.getWidth(multiply: 0.6),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.02),
                  ),
                  CustomeRatingStar(
                    onRatingUpdate: (rating) {
                      bloc.idea = rating;
                    },
                    horizontalStar: context.getWidth(multiply: 0.04),
                    titleText: language.isArabic ? 'الفكرة' : 'IDEA',
                    itemCount: 5,
                    itemSize: context.getWidth(multiply: 0.1),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.02),
                  ),
                  CustomeRatingStar(
                    onRatingUpdate: (rating) {
                      bloc.design = rating;
                    },
                    horizontalStar: context.getWidth(multiply: 0.04),
                    titleText: language.isArabic ? 'التصميم' : 'DESIGN',
                    itemCount: 5,
                    itemSize: context.getWidth(multiply: 0.1),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.02),
                  ),
                  CustomeRatingStar(
                    onRatingUpdate: (rating) {
                      bloc.tools = rating;
                    },
                    horizontalStar: context.getWidth(multiply: 0.04),
                    titleText: language.isArabic ? 'الادوات' : 'TOOLS',
                    itemCount: 5,
                    itemSize: context.getWidth(multiply: 0.1),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.02),
                  ),
                  CustomeRatingStar(
                    onRatingUpdate: (rating) {
                      bloc.practices = rating;
                    },
                    horizontalStar: context.getWidth(multiply: 0.04),
                    titleText: language.isArabic ? 'الممارسات' : 'PRACTICES',
                    itemCount: 5,
                    itemSize: context.getWidth(multiply: 0.1),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.02),
                  ),
                  CustomeRatingStar(
                    onRatingUpdate: (rating) {
                      bloc.presentation = rating;
                    },
                    horizontalStar: context.getWidth(multiply: 0.04),
                    titleText: language.isArabic ? 'العرض' : 'PRESENTATION',
                    itemCount: 5,
                    itemSize: context.getWidth(multiply: 0.1),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.02),
                  ),
                  CustomeRatingStar(
                    onRatingUpdate: (rating) {
                      bloc.investment = rating;
                    },
                    horizontalStar: context.getWidth(multiply: 0.04),
                    titleText: language.isArabic ? 'الاستثمار' : 'INVESTMENT',
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
                          padding: EdgeInsets.only(
                              left: context.getWidth(multiply: 0.06)),
                          child: Text(
                            language.isArabic ? 'ملاحظات' : 'NOTE',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      CostomeDetailsProject(
                        readOnly: false,
                        maxHeight: context.getHeight(multiply: 0.14),
                        heightContainer: context.getHeight(multiply: 0.22),
                        widthContainer: context.getWidth(multiply: 0.9),
                        controller: bloc.noteController,
                        hintText: language.isArabic
                            ? 'ادخل ملاحظاتك'
                            : 'Enter your note',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.03),
                  ),
                  CustomButton(
                    englishTitle: 'Submit',
                    arabicTitle: 'تقييم',
                    onPressed: () {
                      if (bloc.noteController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Your note is required'),
                            backgroundColor: Colors.red[300]));
                      } else {
                        bloc.add(CompleteRatingEvent(projectId: projectId));
                      }
                    },
                    arabic: language.isArabic,
                  ),
                  context.addSpacer()
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
