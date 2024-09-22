import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_management_app/data_layer/data_layer.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/services/setup.dart';
import 'package:project_management_app/theme/appcolors.dart';

import 'custom_evaluation_slider.dart';

class EvaluationScreen extends StatefulWidget {
  final String projectId;
  const EvaluationScreen({super.key, required this.projectId});

  @override
  _EvaluationScreenState createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  List<String> labels = [
    'Idea',
    'Design',
    'Tools',
    'Practices',
    'Presentation',
    'Investment'
  ];

  List<double> sliderValues = List.generate(6, (index) => 0.0);
  String comment = '';

  Future<void> sendRating() async {
    String token = locator.get<DataLayer>().auth!.token;

    try {
      await ApiNetworking().rateProject(
        projectId: widget.projectId,
        idea: sliderValues[0].round(),
        design: sliderValues[1].round(),
        tools: sliderValues[2].round(),
        practices: sliderValues[3].round(),
        presentation: sliderValues[4].round(),
        investment: sliderValues[5].round(),
        note: comment,
        token: token,
      );

      log('success');

      // Optionally show a success message or navigate away
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating submitted successfully!')),
      );
    } catch (e) {
      log('failed');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error submitting rating.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Project Evaluation",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xff4129B7),
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset('assets/Group 58.png'),
                    const SizedBox(width: 20),
                    const Text(
                      'Rating',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4129B7)),
                    ),
                  ],
                ),
                Container(
                  height: 33,
                  width: 78,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: AppColors.blueLight),
                  child: TextButton(
                      onPressed: () async{
                        await sendRating();
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Send',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ...List.generate(labels.length, (index) {
                        return CustomEvaluationSlider(
                          label: labels[index],
                          index: index,
                          onChanged: (value) {
                            setState(() {
                              sliderValues[index] = value;
                            });
                          },
                        );
                      }),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 27,
                            width: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff4129B7),
                            ),
                            child: const Text(
                              'Comment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 80,
                            width: 307,
                            decoration: BoxDecoration(
                              color: const Color(0xffD9D4F1).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  comment = value;
                                });
                              },
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
