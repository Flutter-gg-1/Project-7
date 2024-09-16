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
      create: (context) => HomeCubit()..checkCurrentUser(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${getIt.get<DataLayer>().userInfo?.firstName}"),
              const Text("hello"),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewProjectDetailScreen()));
              }, child: const Text("view"))
            ],
          ),
        ),
      ),
    );
  }
}

