import 'package:flutter/material.dart';

class CustomProfileLinks extends StatelessWidget {
  final String label;
  final String url;
  const CustomProfileLinks({super.key, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 80,
      leading:  Text('$label: ',
          style: const TextStyle(fontSize: 14, color: Color(0xff4129B7))),
      title: Container(
        padding: const EdgeInsets.only(left: 5),
        height: 33,
        width: 250,
        decoration: BoxDecoration(
            color: const Color(0xffD9D4F1),
            borderRadius: BorderRadius.circular(10)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              url,
              style: TextStyle(
                  fontSize: 11,
                  color: const Color(0xff4129B7).withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
