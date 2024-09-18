import 'package:flutter/material.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';

class EditProjectScreen extends StatelessWidget {
  const EditProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTimeRange? RangeValue;
    DateTime? presentationDate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4E2EB5),
        title: Title(
          color: const Color(0xffffffff),
          child: const CustomText(
            text: "Modify Project",
            size: 20,
            color: Color(0xffffffff),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.done, color: Color(0xffffffff)),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                "assets/images/defualt_img.png",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CustomText(
                text: 'change profile picture',
                size: 12,
                color: Color(0xff848484),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const CustomTextFormField(
              label: 'Project name',
              hintText: 'Project name',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Bootcamp name',
              hintText: 'Bootcamp name',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Project Type',
              hintText: 'Website/app/etc...',
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Project duration',
              style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                const CustomText(
                  text:'No date selected yet',
                  size: 12,
                  color: Color(0xff848484),
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
                            child: RangeDatePicker(
                              centerLeadingDate: true,
                              minDate: DateTime(2020, 10, 10),
                              maxDate: DateTime(2030, 10, 30),
                              onRangeSelected: (value) {
                                RangeValue = value;
                                print(RangeValue);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Change'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Presentation date',
              style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                const CustomText(
                  text: 
                      'No date selected yet',
                  size: 12,
                  color: Color(0xff848484),
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
                              //stored range date should be selected
                              centerLeadingDate: true,
                              minDate: DateTime(2020, 10, 10),
                              maxDate: DateTime(2030, 10, 30),
                              onDateSelected: (value) {
                                presentationDate = value;
                                // Handle selected range
                                print(presentationDate);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Change'),
                ),
              ],
            ),
            const CustomTextFormField(
              label: 'Description',
              maximumLines: 5,
              hintText: '',
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Github url',
              hintText: 'https://github.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Figma url',
              hintText: 'https://Figma.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Youtube url',
              hintText: 'https://Youtube.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Pintrest url',
              hintText: 'https://Pintrest.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Playstore url',
              hintText: 'https://app.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Appstore url',
              hintText: 'https://app.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'APK url',
              hintText: 'https://app.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              label: 'Web url',
              hintText: 'https://app.com/example',
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                //handle file import
              },
              child: const Text(
                'Tap to import the presentation file',
                style: TextStyle(
                  color: Color(0xff262626),
                  fontSize: 16,
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
