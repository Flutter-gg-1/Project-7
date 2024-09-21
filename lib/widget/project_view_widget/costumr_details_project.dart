import 'package:flutter/material.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CostomeDetailsProject extends StatelessWidget {
  const CostomeDetailsProject({
    super.key,
    required this.cotentText,
    required this.heightContainer,
    required this.widthContainer,
    this.titleText,
    required this.maxHeight,
    required this.readOnly,
  });

  final String cotentText;
  final double heightContainer;
  final double widthContainer;
  final String? titleText;
  final double maxHeight;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.getHeight(multiply: 0.01),
        horizontal: context.getHeight(multiply: 0.04),
      ),
      width: widthContainer,
      height: heightContainer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 196, 196, 196),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0.5, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            titleText ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: TextFormField(
                  readOnly: readOnly,
                  initialValue: cotentText,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
