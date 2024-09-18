import 'package:flutter/material.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/add_project_screen/create_new_project.dart';
import 'package:project_judge/screens/add_project_screen/edit_project_screen.dart';
import 'package:project_judge/screens/add_project_screen/review_project_screen.dart';

import '../../components/app_bar/custom_app_bar.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  int index = 0;
  DateTime? presentationDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Add a new Project',
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              elevation: 0,
              controlsBuilder: (context, details) {
                return const SizedBox();
              },
              currentStep: index,
              type: StepperType.horizontal,
              onStepTapped: (int stepIndex) {
                setState(() {
                  index = stepIndex;
                });
              },
              steps: [
                Step(
                    label: CustomText(
                      text: "Create",
                      size: 16,
                      color: index == 0 ? const Color(0xff5AE1D0) : Colors.grey,
                    ),
                    title: const SizedBox.shrink(),
                    stepStyle: StepStyle(
                      color:
                          index == 0 ? const Color(0xff5AE1D0) : Colors.white,
                      indexStyle: TextStyle(
                          color: index == 0
                              ? Colors.white
                              : const Color(0xff848484)),
                      border: Border.all(
                          color: index == 0
                              ? const Color(0xff5AE1D0)
                              : const Color(0xff848484)),
                    ),
                    content: CreateNewProject(
                      onDateSelected: (value) {
                        setState(() {
                          presentationDate = value;
                        });
                        Navigator.pop(context);
                      },
                      text: presentationDate != null
                          ? '${presentationDate!.month.toString().padLeft(2, '0')}-${presentationDate!.day.toString().padLeft(2, '0')}-${presentationDate!.year}'
                          : 'No date selected yet',
                      onPressed: () {
                        if (index < 2) {
                          setState(() {
                            index += 1;
                          });
                        }
                      },
                      onCancelPressed: () {
                        if (index > 0) {
                          setState(() {
                            index -= 1;
                          });
                        }
                      },
                    )),
                Step(
                  label: CustomText(
                    text: "Edit",
                    size: 16,
                    color: index == 1 ? const Color(0xff5AE1D0) : Colors.grey,
                  ),
                  title: const SizedBox.shrink(),
                  stepStyle: StepStyle(
                    color: index == 1 ? const Color(0xff5AE1D0) : Colors.white,
                    indexStyle: TextStyle(
                        color: index == 1
                            ? Colors.white
                            : const Color(0xff848484)),
                    border: Border.all(
                        color: index == 1
                            ? const Color(0xff5AE1D0)
                            : const Color(0xff848484)),
                  ),
                  content: EditProjectScreen(
                    onPressed: () {
                      if (index < 2) {
                        setState(() {
                          index += 1;
                        });
                      }
                    },
                    onCancelPressed: () {
                      if (index > 0) {
                        setState(() {
                          index -= 1;
                        });
                      }
                    },
                  ),
                ),
                Step(
                  label: CustomText(
                    text: "Review",
                    size: 16,
                    color: index == 2 ? const Color(0xff5AE1D0) : Colors.grey,
                  ),
                  title: const SizedBox.shrink(),
                  stepStyle: StepStyle(
                    color: index == 2 ? const Color(0xff5AE1D0) : Colors.white,
                    indexStyle: TextStyle(
                        color: index == 2
                            ? Colors.white
                            : const Color(0xff848484)),
                    border: Border.all(
                        color: index == 2
                            ? const Color(0xff5AE1D0)
                            : const Color(0xff848484)),
                  ),
                  content: ReviewProjectScreen(
                    onPressed: () {
                      if (index < 2) {
                        setState(() {
                          index += 1;
                        });
                      }
                    },
                    onCancelPressed: () {
                      if (index > 0) {
                        setState(() {
                          index -= 1;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
