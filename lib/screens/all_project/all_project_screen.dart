import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/all_project/show_projects_cubit/show_projects_cubit.dart';
import 'package:tuwaiq_project/screens/project_info/project_view_screen.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/widget/container/project_container.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = languageLocaitor.get<LanguageLayer>();
    return BlocProvider(
      create: (context) => ShowProjectsCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<ShowProjectsCubit>();

        cubit.showProhect();

        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.getWidth(multiply: 0.1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.addSpacer(multiply: 0.008),
              Text(
                language.isArabic ? 'معسكرات طويق' : 'Tuwaiq BootCamp',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              SizedBox(
                height: context.getHeight(multiply: 0.65),
                child: BlocBuilder<ShowProjectsCubit, ShowProjectsState>(
                  builder: (context, state) {
                    if (state is ShowAllProjectState) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: state.projectList.length,
                        itemBuilder: (context, index) {
                          return ProjectContainer(
                            projectsModel: state.projectList[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ProjectViewScreen(
                                    projectsModel: state.projectList[index],
                                  );
                                },
                              ));
                            },
                          );
                        },
                      );
                    }

                    if (state is LodingProjectState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ErorrProjectState) {
                      return Center(
                        child: Text(state.msg),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
              //
            ],
          ),
        );
      }),
    );
  }
}
