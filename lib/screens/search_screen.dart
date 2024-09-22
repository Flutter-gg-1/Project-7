import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/services/setup.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = languageLocaitor.get<LanguageLayer>();
    return Column(
      children: [
        SizedBox(
          height: context.getHeight(multiply: 0.045),
        ),
        SizedBox(
            width: context.getWidth(multiply: 0.9),
            child: CustomTextFeild(
              hintText: 'Search for Project',
              isArabic: language.isArabic,
            )),
        Image.asset(
          'assets/image/Search-amico(1).png',
          height: context.getHeight(multiply: 0.4),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_rounded),
              Text(
                language.isArabic
                    ? '...بحث عن المشاريع'
                    : 'Search For Project...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  final bool isArabic;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  //final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final String? initialValue;
  final Function(String)? onChanged;
  const CustomTextFeild({
    super.key,
    required this.hintText,
    this.maxLines,
    this.controller,
    this.validator,
    this.keyboardType,
    this.padding,
    this.initialValue,
    this.onChanged,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      keyboardType: keyboardType,
      //inputFormatters: inputFormatters,
      validator: validator,
      controller: controller,
      minLines: maxLines,
      maxLines: maxLines,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search),
          hintText: hintText,
          hintTextDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xffb8b8b8)),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
