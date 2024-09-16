import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';

dialog({required BuildContext context, Function()? onDone}) {
  TextEditingController? controller;
  String? Function(String?)? validate;
  final language = languageLocaitor.get<LanguageLayer>();
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              height: context.getWidth(multiply: 0.5),
              width: context.getHeight(multiply: 0.9),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Update URL',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          width: context.getWidth(multiply: 0.05),
                        ),
                        const Text(
                          'Discord ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.getWidth(multiply: 0.7),
                    child: TextFormField(
                      validator: validate,
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black38),
                        hintText: 'https://discord.imaha.com',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.035),
                  ),
                  CustomButton(
                    onPressed: () {},
                    arabicTitle: 'تعديل',
                    englishTitle: 'Update',
                    arabic: language.isArabic,
                  ),
                ],
              ),
            ),
          ));
}