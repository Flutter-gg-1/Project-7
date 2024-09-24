import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project_judge/components/dialog/error_dialog.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/screens/add_project_screen/cubit/add_project_cubit.dart';
import '../../components/app_bar/custom_app_bar.dart';
import '../../components/buttons/custom_elevated_button.dart';
import '../../components/text_field/custom_text_form_field.dart';

class AddProjectScreen extends StatelessWidget {
  AddProjectScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProjectCubit(),
      child: Builder(builder: (context) {
        final bloc = context.read<AddProjectCubit>();
        TextEditingController idController =
            TextEditingController(text: bloc.userId ?? '');
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
            backgroundColor: const Color(0xffFBFBFB),
            appBar: const CustomAppBar(
              text: 'Add a new Project',
            ),
            body: BlocBuilder<AddProjectCubit, AddProjectState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add ID
                          const SizedBox(height: 30),
                          const CustomText(
                              text: "Enter the ID of the lead member",
                              size: 16),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Please Enter ID';
                              }
                              return null;
                            },
                            onChange: (value) {
                              bloc.userId = idController.text;
                            },
                            controller: idController,
                            hintText: "User ID",
                            icon: Icons.person_outline_rounded,
                            fillColor: Colors.transparent,
                          ),
                          const SizedBox(height: 30),
                          const CustomText(
                              text: "Select end date of this project",
                              size: 16),
                          const SizedBox(height: 10),
                          // Add date
                          BlocBuilder<AddProjectCubit, AddProjectState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  CustomText(
                                    text: bloc.EndDate != null
                                        ? '${bloc.EndDate!.month.toString().padLeft(2, '0')}/${bloc.EndDate!.day.toString().padLeft(2, '0')}/${bloc.EndDate!.year}'
                                        : 'No date selected yet',
                                    size: 12,
                                    color: const Color(0xff848484),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  DatePicker(
                                                    centerLeadingDate: true,
                                                    minDate:
                                                        DateTime(2020, 10, 10),
                                                    maxDate:
                                                        DateTime(2030, 10, 30),
                                                    onDateSelected: (value) {
                                                      bloc.EndDate = value;
                                                    },
                                                  ),
                                                  const SizedBox(height: 16),
                                                  CustomElevatedButton(
                                                    backgroundColor:
                                                        const Color(0xff4E2EB5),
                                                    text: 'Confirm',
                                                    textcolor:
                                                        const Color(0xffffffff),
                                                    onPressed: () {
                                                      bloc.saveDate();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Change'),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          const CustomText(
                              text: "Can the lead member edit this project?",
                              size: 16),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: DropdownButton<int>(
                                value: bloc.canEdit,
                                hint: const Text('Select option'),
                                items: [
                                  const DropdownMenuEntry(
                                      value: 0, label: "Yes"),
                                  const DropdownMenuEntry(
                                      value: 1, label: "No"),
                                ].map((entry) {
                                  return DropdownMenuItem<int>(
                                    value: entry.value,
                                    child: Text(entry.label),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  if (newValue != null) {
                                    bloc.saveEditOption(newValue);
                                  }
                                },
                                isExpanded: true,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    //create the project
                                    if (formKey.currentState?.validate() ==
                                        true) {
                                      if (bloc.EndDate == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please Enter An End Date'),
                                            backgroundColor: Color(0xff4D2EB4),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      } else {
                                        bloc.createAccountMethod();
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(385, 63),
                                    backgroundColor: const Color(0xff4D2EB4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const CustomText(
                                    text: "Create",
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
