import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/bloc/project_bloc.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<ProjectBloc>();

        var languageLayer = languageLocaitor.get<LanguageLayer>();
        return BlocListener<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is SucsessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(context.getWidth(multiply: 1),
                        context.getHeight(multiply: 0.1)),
                    painter: AuthShape(),
                  ),
                  context.addSpacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.getWidth(multiply: 0.1)),
                    child: Column(
                      children: [
                        Text(
                          languageLayer.isArabic
                              ? 'تعديل المشروع'
                              : 'Edit project',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(context.getWidth(multiply: 0.8),
                                  context.getHeight(multiply: 0.05)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor:
                                  const Color.fromARGB(255, 77, 46, 180),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(),
                              );
                            },
                            child: const Text(
                              'Edit Logo',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
