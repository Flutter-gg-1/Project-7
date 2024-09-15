import 'package:flutter/material.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/setup/init_setup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(getIt.get<DataLayer>().userInfo!.firstName),
            Text(getIt.get<DataLayer>().userInfo!.lastName)
          ],
        ),
      ),
    );
  }
}
