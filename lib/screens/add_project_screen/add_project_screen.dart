import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/add_project_screen/create_new_project.dart';
import 'package:project_judge/screens/add_project_screen/cubit/add_project_cubit.dart';
import 'package:project_judge/screens/add_project_screen/edit_project_screen.dart';
import 'package:project_judge/screens/add_project_screen/review_project_screen.dart';
import '../../components/app_bar/custom_app_bar.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProjectCubit(),
      child: Scaffold(
        appBar: const CustomAppBar(
          text: 'Add a new Project',
        ),
        body: BlocBuilder<AddProjectCubit, AddProjectState>(
          builder: (context, state) {
            final cubit = context.read<AddProjectCubit>();
            int index = 0;

            if (state is StepperState) {
              index = state.indexStep;
            }

            return Column(
              children: [
                Expanded(
                  child: Stepper(
                    elevation: 0,
                    controlsBuilder: (context, details) {
                      return const SizedBox();
                    },
                    currentStep: index,
                    type: StepperType.horizontal,
                    steps: [
                      Step(
                        label: CustomText(
                          text: "Create",
                          size: 16,
                          color: index == 0
                              ? const Color(0xff5AE1D0)
                              : Colors.grey,
                        ),
                        title: const SizedBox.shrink(),
                        stepStyle: StepStyle(
                          color: index == 0
                              ? const Color(0xff5AE1D0)
                              : Colors.white,
                          indexStyle: TextStyle(
                            color: index == 0
                                ? Colors.white
                                : const Color(0xff848484),
                          ),
                          border: Border.all(
                            color: index == 0
                                ? const Color(0xff5AE1D0)
                                : const Color(0xff848484),
                          ),
                        ),
                        content: CreateNewProject(
                          onDateSelected: (value) {
                            cubit.selectDate(value);
                            Navigator.pop(context);
                          },
                          text: state is StepperState &&
                                  state.presentationDate != null
                              ? '${state.presentationDate!.month.toString().padLeft(2, '0')}-${state.presentationDate!.day.toString().padLeft(2, '0')}-${state.presentationDate!.year}'
                              : 'No date selected yet',
                          onPressed: () {
                            cubit.nextStep();
                          },
                          onCancelPressed: () {
                            cubit.previousStep();
                          },
                        ),
                      ),
                      Step(
                        label: CustomText(
                          text: "Edit",
                          size: 16,
                          color: index == 1
                              ? const Color(0xff5AE1D0)
                              : Colors.grey,
                        ),
                        title: const SizedBox.shrink(),
                        stepStyle: StepStyle(
                          color: index == 1
                              ? const Color(0xff5AE1D0)
                              : Colors.white,
                          indexStyle: TextStyle(
                            color: index == 1
                                ? Colors.white
                                : const Color(0xff848484),
                          ),
                          border: Border.all(
                            color: index == 1
                                ? const Color(0xff5AE1D0)
                                : const Color(0xff848484),
                          ),
                        ),
                        content: EditProjectScreen(
                          onPressed: () {
                            cubit.nextStep();
                          },
                          onCancelPressed: () {
                            cubit.previousStep();
                          },
                        ),
                      ),
                      Step(
                        label: CustomText(
                          text: "Review",
                          size: 16,
                          color: index == 2
                              ? const Color(0xff5AE1D0)
                              : Colors.grey,
                        ),
                        title: const SizedBox.shrink(),
                        stepStyle: StepStyle(
                          color: index == 2
                              ? const Color(0xff5AE1D0)
                              : Colors.white,
                          indexStyle: TextStyle(
                            color: index == 2
                                ? Colors.white
                                : const Color(0xff848484),
                          ),
                          border: Border.all(
                            color: index == 2
                                ? const Color(0xff5AE1D0)
                                : const Color(0xff848484),
                          ),
                        ),
                        content: ReviewProjectScreen(
                          onPressed: () {
                            cubit.nextStep();
                          },
                          onCancelPressed: () {
                            cubit.previousStep();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
