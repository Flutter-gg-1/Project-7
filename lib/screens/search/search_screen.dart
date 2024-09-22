import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/project_info/project_view_screen.dart';
import 'package:tuwaiq_project/screens/search/cubit/search_screen_cubit.dart';
import 'package:tuwaiq_project/widget/container/project_container.dart';
import 'package:tuwaiq_project/widget/search_screen/info_serch_coulm_widget.dart';
import 'package:tuwaiq_project/widget/textformfeild/custom_text_feild.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<SearchScreenCubit>();
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.getHeight(multiply: 0.02),
              ),
              SizedBox(
                  width: context.getWidth(multiply: 0.9),
                  child: CustomTextFeild(
                      isArabic: cubit.language.isArabic,
                      onFieldSubmitted: (p0) {
                        cubit.serchProject(searchTex: p0);
                      },
                      maxLines: 1,
                      hintText: cubit.language.isArabic
                          ? 'البحث عن المشروع'
                          : 'Search for Project')),
              BlocBuilder<SearchScreenCubit, SearchScreenState>(
                builder: (context, state) {
                  if (state is SearchScreenLodingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is SearchScreenShowFoundState) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: context.getWidth(multiply: 0.05)),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.56,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.projectsLis.length,
                      itemBuilder: (context, index) {
                        return ProjectContainer(
                          projectsModel: state.projectsLis[index],
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ProjectViewScreen(
                                  projectsModel: state.projectsLis[index],
                                );
                              },
                            ));
                          },
                        );
                      },
                    );
                  }

                  if (state is SearchScreenErorrState) {
                    return InfoSerchCoulmWidget(
                      tex: state.msg,
                    );
                  }

                  if (state is SearchScreenNotFoundState) {
                    return const InfoSerchCoulmWidget(
                      tex: "Not Found...",
                    );
                  }

                  return SingleChildScrollView(
                    child: InfoSerchCoulmWidget(
                      tex: cubit.language.isArabic
                          ? "...البحث عن المشاريع"
                          : "Search For Project...",
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
