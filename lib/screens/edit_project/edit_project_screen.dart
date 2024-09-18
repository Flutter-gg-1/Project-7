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
        backgroundColor: Color(0xff4E2EB5),
        title: Title(
          color: Color(0xffffffff),
          child: CustomText(
            text: "Modify Project",
            size: 20,
            color: const Color(0xffffffff),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.done, color: Color(0xffffffff)),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                "assets/images/defualt_img.png",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: 'change profile picture',
                size: 12,
                color: Color(0xff848484),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            CustomTextFormField(
              label: 'Project name',
              hintText: 'Project name',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Bootcamp name',
              hintText: 'Bootcamp name',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Project Type',
              hintText: 'Website/app/etc...',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Project duration',
              style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                CustomText(
                  text: RangeValue != null
                      ? RangeValue.toString()
                      : 'No date selected yet',
                  size: 12,
                  color: Color(0xff848484),
                ),
                Spacer(),
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
                                // Handle selected range
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
            SizedBox(
              height: 10,
            ),
            Text(
              'Presentation date',
              style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                CustomText(
                  text: presentationDate != null
                      ? presentationDate.toString()
                      : 'No date selected yet',
                  size: 12,
                  color: Color(0xff848484),
                ),
                Spacer(),
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
            CustomTextFormField(
              label: 'Description',
              maximumLines: 5,
              hintText: '',
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Github url',
              hintText: 'https://github.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Figma url',
              hintText: 'https://Figma.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Youtube url',
              hintText: 'https://Youtube.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Pintrest url',
              hintText: 'https://Pintrest.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Playstore url',
              hintText: 'https://app.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Appstore url',
              hintText: 'https://app.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'APK url',
              hintText: 'https://app.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Web url',
              hintText: 'https://app.com/example',
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            TextButton(
              onPressed: () {
                //handle file import
              },
              child: Text(
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
