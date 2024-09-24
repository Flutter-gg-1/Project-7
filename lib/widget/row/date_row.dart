import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class DateRow extends StatelessWidget {
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;
  final TextEditingController? presentationDateController;
  const DateRow({
    super.key,
    this.startDateController,
    this.endDateController,
    this.presentationDateController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Start Date'),
            context.addSpacer(multiply: 0.008),
            SizedBox(
                height: context.getHeight(multiply: 0.09),
                width: context.getWidth(multiply: 0.26),
                child: NormalTextFormFeild(
                    controller: startDateController,
                    keyboardType: TextInputType.datetime,
                    hintText: 'yyyy-mm-dd'))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('End Date'),
            context.addSpacer(multiply: 0.008),
            SizedBox(
                height: context.getHeight(multiply: 0.09),
                width: context.getWidth(multiply: 0.26),
                child: NormalTextFormFeild(
                  controller: endDateController,
                  hintText: 'yyyy-mm-dd',
                  keyboardType: TextInputType.datetime,
                ))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Presentation Date'),
            context.addSpacer(multiply: 0.008),
            SizedBox(
                height: context.getHeight(multiply: 0.09),
                width: context.getWidth(multiply: 0.26),
                child: NormalTextFormFeild(
                  controller: presentationDateController,
                  hintText: 'yyyy-mm-dd',
                  keyboardType: TextInputType.datetime,
                ))
          ],
        ),
      ],
    );
  }
}
