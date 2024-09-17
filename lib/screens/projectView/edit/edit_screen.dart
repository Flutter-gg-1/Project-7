import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/projectView/bloc/project_bloc.dart';
import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<EditBloc>();

        var languageLayer = languageLocaitor.get<LanguageLayer>();
        return Scaffold(
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
                Text(
                  languageLayer.isArabic
                      ? 'عدل على مشروعك'
                      : 'Edit your project',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                SizedBox(
                  height: context.getHeight(multiply: 0.65),
                  child: PageView(
                    children: [
                      SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.1)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  languageLayer.isArabic
                                      ? 'تعديل الشعار'
                                      : 'Edit logo',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '1 / 6',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Text('Edit Project Base'),
                      const Text('Edit Project Presentation'),
                      const Text('Edit Project Images'),
                      const Text('Edit Project Links'),
                      const Text('Edit Project Members'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
