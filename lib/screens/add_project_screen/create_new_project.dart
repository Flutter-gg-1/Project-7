import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/components/text/custom_text.dart';

import '../../components/text_field/custom_text_form_field.dart';

class CreateNewProject extends StatelessWidget {
  const CreateNewProject(
      {super.key,
      required this.onDateSelected,
      required this.text,
      this.onPressed,
      this.onCancelPressed});
  final Function(DateTime) onDateSelected;
  final String text;
  final Function()? onPressed;
  final Function()? onCancelPressed;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const CustomText(text: "Enter the ID of the lead member", size: 16),
        const SizedBox(height: 10),
        const CustomTextFormField(
          hintText: "User ID",
          icon: Icons.person_outline_rounded,
          fillColor: Colors.transparent,
        ),
        const SizedBox(height: 30),
        const CustomText(text: "Select end date of this project", size: 16),
        const SizedBox(height: 10),
        Row(
          children: [
            CustomText(
              text: text,
              size: 16,
              color: const Color(0xff848484),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DatePicker(
                            centerLeadingDate: true,
                            minDate: DateTime(2020, 10, 10),
                            maxDate: DateTime(2030, 10, 30),
                            onDateSelected: onDateSelected),
                      ),
                    );
                  },
                );
              },
              child: const Text('Change'),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const CustomText(
            text: "Can the lead member edit this project?", size: 16),
        const SizedBox(height: 10),
        const DropdownMenu(
            width: 380,
            initialSelection: 0,
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 0, label: "Yes"),
              DropdownMenuEntry(value: 1, label: "No"),
            ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: onPressed,
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
              const SizedBox(height: 8),
              TextButton(
                onPressed: onCancelPressed,
                child: const CustomText(
                  text: "Cancel",
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
