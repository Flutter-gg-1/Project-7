import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project_judge/components/dialog/error_dialog.dart';
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
      child: Builder(builder: (context) {
        final cubit = context.read<AddProjectCubit>();
        return BlocListener<AddProjectCubit, AddProjectState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: Lottie.asset("assets/json/Loading animation.json"),
                ),
              );
            } else if (state is SuccessState) {
              Navigator.pop(context);
              cubit.nextStep();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Project created successfully!',
                    style: TextStyle(color: Color(0xFF4E2EB5)),
                  ),
                  backgroundColor: Colors.white,
                  duration: Duration(seconds: 2),
                ),
              );
            } else if (state is ErrorState) {
              showErrorDialog(context, state.msg);
            }
          },
          child: Scaffold(
            backgroundColor: Color(0xffFBFBFB),
            appBar: const CustomAppBar(
              text: 'Add a new Project',
            ),
            body: BlocBuilder<AddProjectCubit, AddProjectState>(
              builder: (context, state) {
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
                              onPressed: () {},
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
      }),
    );
  }
}
