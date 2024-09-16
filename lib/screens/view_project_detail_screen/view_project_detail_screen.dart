import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/app_bar/custom_app_bar.dart';

class ViewProjectDetailScreen extends StatelessWidget {
  const ViewProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Project Details',
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/svg/Tuwaiq_logo.svg")],
      ),
    );
  }
}
