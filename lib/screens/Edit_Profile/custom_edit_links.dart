import 'package:flutter/material.dart';

class CustomEditLinks extends StatelessWidget {
  final String label;
  const CustomEditLinks({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 80,
      leading: Text('$label: ',
          style: const TextStyle(fontSize: 14, color: Color(0xff4129B7))),
      title: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: const TextField(
            cursorColor: Colors.black,
            maxLines: 1,
            style: TextStyle(fontSize: 16),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          )),
    );
  }
}
