import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

class CustomeRatingStar extends StatelessWidget {
  const CustomeRatingStar({
    super.key,
    required this.itemCount,
    required this.itemSize,
    required this.titleText,
    required this.horizontalStar,
    required this.onRatingUpdate,
  });

  final int itemCount;
  final double itemSize;
  final String titleText;
  final double horizontalStar;
  final Function(double) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: context.getWidth(multiply: 0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            RatingBar.builder(
              initialRating: 2,
              minRating: 0.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: itemCount,
              itemPadding: EdgeInsets.symmetric(horizontal: horizontalStar),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: onRatingUpdate,
              itemSize: itemSize,
              unratedColor: Colors.grey[300],
              glow: false,
              glowColor: Colors.amber.withOpacity(0.5),
              ignoreGestures: false,
            ),
          ],
        ),
      ),
    );
  }
}
