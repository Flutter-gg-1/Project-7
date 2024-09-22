import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management_app/data_layer/data_layer.dart';
import 'package:project_management_app/screens/Evaluation/bloc/evaluation_bloc.dart';
import 'package:project_management_app/services/setup.dart';
import 'package:project_management_app/theme/appcolors.dart';

import 'custom_evaluation_slider.dart';

class EvaluationScreen extends StatelessWidget {
  final String projectId;
  const EvaluationScreen({super.key, required this.projectId});

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
    child: BlocProvider(
      create: (context) => EvaluationBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text("Project Evaluation",
                style: TextStyle(color: Colors.white)),
            backgroundColor: const Color(0xff4129B7),
          ),
          body: BlocListener<EvaluationBloc, EvaluationState>(
            listener: (context, state) {
              if (state is EvaluationSuccessfulState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Project Rated Successfully!'),
                ));
                Navigator.pop(context);
              }
            },
            child: BlocBuilder<EvaluationBloc, EvaluationState>(
              builder: (context, state) {
                return Column(
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
                              onPressed: () async {
                                final bloc = context.read<EvaluationBloc>();
                                final token = locator.get<DataLayer>().auth!.token;
                                bloc.add(SendRatingEvent(token: token, projectId: projectId));
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
                                    context.read<EvaluationBloc>().add(
                                        UpdateSliderValue(index: index, value: value));
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
                                        context.read<EvaluationBloc>().add(UpdateComment(comment: value));
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
                );
              },
            ),
          ),
        );
      }),
    ));
  }
}
