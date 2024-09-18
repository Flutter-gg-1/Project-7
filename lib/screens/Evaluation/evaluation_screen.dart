import 'package:flutter/material.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/theme/appcolors.dart';

import 'custom_evaluation_slider.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({super.key});

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
    String projectId = 'p-JGqY6xjCAK';
    String token =
        'YWU1YzhkZmU4MWI3NWE1Y2Y3MzQ0ZjQwNTg2NmQwOWI4MWUwZTExZjQyNDNlNTI1YzRiNDAzMDBiZDE0YWQ0MTIxMTBmNGNhYjgyZjIwZDU4NmYyMjllNmY0MmY2ZTE1ZDEzODAwNTQ3ODc0MzQ0YjU4MTNmNDljZGU1NmYyMjE1NDk3NjdhNzYyN2UxZWMzYjQ0NGZhZDZhMzA0OTY4M2QwMDYyYmEzZjAzMzU5OWIyMDNjODVjZDQyYTRiYjk4YjU2NzYxZDFlYmVkNzExZGU4ZjAyNGE1NjAxMTg2ZjE0Yjc1MjIwNGM0MDdkYmNmZTc2NWJlYzY4MDU0ZjAzYmNmZGY3NWM1ZDgxZGYwZWE1ZDllOTc1MDIxMTVhNWI4YjU5ODAyMTM0MTc2NmRjYjA3ZjE4ZDZlMmRlM2M0ZThjODc3OTFjNGMyOTUwYjE5MmVjMzJlMTZkN2JiNDRhNWI3NzU0MDIyYTdmODk3MzE3NWQ1MzM5NTUzODNhYmExZGY1MzE5OTY0YWYwYjc0MmMxZThmNTI4YmZiODNlMTE1OTE3ZTZjYjMyMWQ2NmJlNDA5YTA2Y2RmYTFkZWRhNzE5ZTU2MTFlMGIyN2NjMDE1MjI5ZmM1ZGVkYTgxMjViZDNjZmVmM2M4MDg5NjA4OWJlMGE0M2NjY2E2MDc0ZmYyZTQ5MDVhM2RmMDI2ZDU4NDhiNDhmYzBkYjY1MGFlMGY3NzFiZTlkOWU4OGQ0ZDk5YzNkODkxNWNjMGRhNzdlOGZiNWY1NzNlMGFkNWU1N2U0MWZjODQ0MzhjYWJmZThlZGVkYWI1ODQ2OTIzNzE4MDFhZWZmZGRkZTkzMmVlN2FmMTgzMjA0ZmMxZDMxMmMzYWU5YzRkNGZhOGMwMzg4NmI4NDU3ODg5YjlhMGM1Zjk4YWU0N2EwNjVhYTcwMmU1OGI4NmRiNTk1ODRjNzM5MjBkODY2MGRiYzRkNjk4MjA3OGMwYWIxNjA0NzgzOTk4NTE3NmFkYjE2ZGRiZjdlNTMwOGVhYmM3ODc3YmI2YWIxMTQzMjczMzBjMjljZmU1OTc5ZDMzYzViN2IzZmI0YzMxZjQ1ZjhiMDZmZDVjMTczZjQzN2RlZjM1MGE0NmY1OTc0NjFjNTY3MmZjOWI1ZmQ0OTRhNjUyMmQyZWY0YmE0NDM5YzA2NDRmMzA0YWEzODk1ZDQyYWUzOWRiMTVlNjBjYWZmODkzNjRjZjI3MTMzMzI4ZTIwNWU1OTc4YmNkODJkMGVlMzVlODc4OTg4OTg5OWI5ZmVjZjRiNzZiZGE3NmMzNTBlOWM2ZDJiODgwNThkNWYwYjZiMmQzY2YxMTJkYjY2YzQwMTE0YWU5YmM1NmU4ODZiN2UzNTc1NjE4ZWZlMjQ0YmY2ZTFmMTc4ZmY2ODI5MTljNjk5YzNmOGM2ZTI4NDM4NzkzNmRlNTk2YzUxMDk3ODE4MGIzYTY2OTk5OWE0Y2JjZGZjODg1ZTU5ZTU0NTU4YjllNzhhZmM5OTNlZjA5NWQ5MTA5OTUwZGNlMzk5ZjgwZGVmYzRjNDlkMDE4YWQ1ODM3YTc0N2QyOWJiMTZiNDEyN2M5ZDY1NGYzMDRmMWU1OWI2YzhlYzUyNTYyZTA1MjkxMmJiM2RjZjM3NmI1MzYwNDcxZDc0NDMzNDJlMDUyNDVmYWIzMjIzNDZjZmQ2NmJmNjFlY2E0YzVkM2I0NThjYTU0ZjdkZWIxODc2MjkxMDY5MGU1YTQwMGY3NmVmYzAzNzY4NmZhYjc1MDY2NTNiMmJhNzQ1NGE0OGU3ZTFiZDg5NWE3ZDVkOTk2ZTQxNmExMjY0ZjNlMTA0N2Y5ZGM2ZDA1NmI5ZDM3YzU4YjkwYTA0Zjc0ZmI3MTU5ZTM4Nzk1ZDBkOTRlZDRlMGM4YTc4ZjI2MjA4YTQ1YjY1MTE4YWRjNWY0YWM2NDhmNWQ4YjI2YzI0OTFiNmJkZTE3N2U3ZWJlMzc0ZDBkMTMxODEzZGJkY2QwMWZjYzc1NzQ2ODlhNWI1ZGYyZTE1NWZkNDc4N2MxODRjYzA1Mjg4ZWU0OTdhMTFkMmU4MjEwMjhjZDBlZjBiZGI0MDUxNThmYjdmODc3Yjk0OTBlZTVkNjViZjUyMzhjYWY4YjZiMjk4YzIyY2M2ZDEzYTRmNzYzNzRhYmExYjVkZTJiZTIwYTNjODI3M2I4MzZiZjc0ODJmMTkxZDU2NWQ3ODJiZWZlYTQ5OGU5MTY1ZDZkZTY1';

    try {
      await ApiNetworking().rateProject(
        projectId: projectId,
        idea: sliderValues[0].round(),
        design: sliderValues[1].round(),
        tools: sliderValues[2].round(),
        practices: sliderValues[3].round(),
        presentation: sliderValues[4].round(),
        investment: sliderValues[5].round(),
        note: comment,
        token: token,
      );

      // Optionally show a success message or navigate away
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating submitted successfully!')),
      );
    } catch (e) {
      // Handle error
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
            const SizedBox(height: 20),
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
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Logo Project',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            height: 88,
                            width: 178,
                            decoration: BoxDecoration(
                              color: const Color(0xffD9D4F1).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(child: Text('Project Details')),
                          )
                        ],
                      ),
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
                              decoration: InputDecoration(
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
