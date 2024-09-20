import 'package:flutter/material.dart';
import 'package:project_management_app/models/project_model.dart';

class CustomProjectInfo extends StatelessWidget {
  final String label;
  final String content;
  const CustomProjectInfo({super.key,required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(0xff4129B7),
          ),
        ),
        if(!label.contains('Description'))
        Text(
         content,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffB8B8BB),
          ),
        )
        else
        Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB8B8BB),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
