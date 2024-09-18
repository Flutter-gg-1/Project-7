import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/screens/home_screen/cubit/home_cubit.dart';
import 'package:project_judge/screens/view_project_detail_screen/view_project_detail_screen.dart';
import 'package:project_judge/setup/init_setup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final currentUser = getIt.get<DataLayer>().userInfo;

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(currentUser?.firstName ?? "null"),
                Text(currentUser?.lastName ?? "null"),
                Text(currentUser?.email ?? "null"),
                Text(currentUser?.role ?? "null"),
                Text(currentUser?.createdAt ?? "null"),
                Text(
                    textAlign: TextAlign.center,
                    currentUser?.link!.toJson().toString() ?? "null"),
              ],
            ),
          ),
        );
      }),
    );
  }
}

