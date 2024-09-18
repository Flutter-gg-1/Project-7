import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';

import 'custom_evaluation_slider.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Idea',
      'Design',
      'Tools',
      'Practices',
      'Presentation',
      'Investment'
    ];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset('assets/Group 58.png'),
                    const SizedBox(
                      width: 20,
                    ),
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
                      onPressed: () {},
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Send',
                        style: TextStyle(fontSize: 16, color: Colors.white
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xffD9D4F1),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      blurStyle: BlurStyle.inner,
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 4)
                                ]),
                            child: const Center(
                                child: Text(
                              'Logo Project',
                              textAlign: TextAlign.center,
                            )),
                          ),
                          Container(
                            // custom widget from home page
                            height: 88,
                            width: 178,
                            decoration: BoxDecoration(
                                color: const Color(0xffD9D4F1).withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(child: Text('Project Details')),
                          )
                        ],
                      ),
                      ...List.generate(labels.length, (index) {
                        return CustomEvaluationSlider(
                          label: labels[index],
                          index: index,
                        );
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 27,
                              width: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xff4129B7)),
                              child: const Text(
                                'Comment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              height: 80,
                              width: 307,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffD9D4F1).withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                ),
                              ))
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
