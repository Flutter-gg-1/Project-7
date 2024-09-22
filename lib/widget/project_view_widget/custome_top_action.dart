import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeActionProject extends StatelessWidget {
  const CustomeActionProject({
    super.key,
    this.qrCodeButton,
    this.editClick,
  });

  final Function()? qrCodeButton;
  final Function()? editClick;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: editClick,
            icon: FaIcon(
              FontAwesomeIcons.pencil,
              color: const Color.fromARGB(255, 74, 74, 232),
              size: context.getWidth(multiply: 0.05),
            ),
          ),
          IconButton(
              onPressed: qrCodeButton,
              icon: const Icon(Iconsax.scan_barcode_outline)),
          SizedBox(
            width: context.getWidth(multiply: 0.03),
          )
        ],
      ),
    );
  }
}
