import 'package:flutter/material.dart';
import 'package:project_management_app/services/launch_url.dart';

class CustomProfileLinks extends StatelessWidget {
  final String label;
  final String url;
  const CustomProfileLinks({super.key, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 80,
      leading: Text('$label: ',
          style: const TextStyle(fontSize: 14, color: Color(0xff4129B7))),
      title: Container(
        padding: const EdgeInsets.only(left: 5),
        height: 33,
        width: 250,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                launchLink(url);
              },
              child: Text(
                url,
                style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xffB4B4B7),
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
