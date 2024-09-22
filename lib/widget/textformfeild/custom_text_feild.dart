// <<<<<<< HEAD:lib/screens/search_screen.dart
// import 'package:flutter/material.dart';
// 
// import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
// import 'package:tuwaiq_project/services/setup.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final language = languageLocaitor.get<LanguageLayer>();
//     return Column(
//       children: [
//         SizedBox(
//           height: context.getHeight(multiply: 0.045),
//         ),
//         SizedBox(
//             width: context.getWidth(multiply: 0.9),
//             child: CustomTextFeild(
//               hintText: 'Search for Project',
//               isArabic: language.isArabic,
//             )),
//         Image.asset(
//           'assets/image/Search-amico(1).png',
//           height: context.getHeight(multiply: 0.4),
//         ),
//         Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.search_rounded),
//               Text(
//                 language.isArabic
//                     ? '...بحث عن المشاريع'
//                     : 'Search For Project...',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
// =======
import 'dart:developer';

import 'package:flutter/material.dart';
// >>>>>>> 6d42ac97784047bf0d7a6a415abc15a887f50569:lib/widget/textformfeild/custom_text_feild.dart

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
// <<<<<<< HEAD:lib/screens/search_screen.dart
//   const CustomTextFeild({
//     super.key,
//     required this.hintText,
//     this.maxLines,
//     this.controller,
//     this.validator,
//     this.keyboardType,
//     this.padding,
//     this.initialValue,
//     this.onChanged,
//     required this.isArabic,
//   });
// =======
  final Function(String)? onFieldSubmitted;
  const CustomTextFeild(
      {super.key,
      required this.hintText,
      this.maxLines,
      this.controller,
      this.validator,
      this.keyboardType,
      this.padding,
      this.initialValue,
      this.onChanged,
      this.onFieldSubmitted,
      required this.isArabic});
// >>>>>>> 6d42ac97784047bf0d7a6a415abc15a887f50569:lib/widget/textformfeild/custom_text_feild.dart

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

      onFieldSubmitted: onFieldSubmitted,
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
