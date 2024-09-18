import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeActionProject extends StatelessWidget {
  const CustomeActionProject({
    super.key,
    this.reviewClick,
    this.editClick,
    this.deleteClick,
  });

  final Function()? reviewClick;
  final Function()? editClick;
  final Function()? deleteClick;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: deleteClick,
            icon: FaIcon(
              FontAwesomeIcons.trash,
              color: const Color.fromARGB(174, 255, 0, 0),
              size: context.getWidth(multiply: 0.05),
            ),
          ),
          IconButton(
            onPressed: editClick,
            icon: FaIcon(
              FontAwesomeIcons.pencil,
              color: const Color.fromARGB(255, 160, 88, 255),
              size: context.getWidth(multiply: 0.05),
            ),
          ),
          Container(
            width: context.getWidth(multiply: 0.17),
            height: context.getHeight(multiply: 0.04),
            decoration: BoxDecoration(
                color: const Color.fromARGB(207, 77, 46, 180),
                borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                onPressed: reviewClick,
                child: const Text(
                  'Reviews',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
          SizedBox(
            width: context.getWidth(multiply: 0.03),
          )
        ],
      ),
    );
  }
}