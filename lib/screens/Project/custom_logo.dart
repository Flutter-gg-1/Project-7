import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';
import 'package:sizer/sizer.dart';

class CustomLogo extends StatelessWidget {
  final String? logoUrl;
  final bool isLogo;
  const CustomLogo({super.key, required this.logoUrl, this.isLogo = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        height: 8.h,
        width: 8.h,
        decoration: BoxDecoration(
          color: AppColors.blueDark,
          borderRadius: BorderRadius.circular(1.4.h),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.4,
              blurRadius: 3.5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
            child: isLogo
                ? Image.network(
                    logoUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image,
                        size: 28,
                        color: Colors.white,
                      );
                    },
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                : Image.asset('assets/1_5-aoK8IBmXve5whBQM90GA.png')),
      ),
    );
  }
}
