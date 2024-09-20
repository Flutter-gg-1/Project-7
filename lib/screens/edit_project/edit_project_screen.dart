import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/screens/edit_project/bloc/edit_project_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class EditProjectScreen extends StatelessWidget {
  const EditProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProjectBloc(),
      child: const EditProjectForm(),
    );
  }
}

class EditProjectForm extends StatelessWidget {
  const EditProjectForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4E2EB5),
        title: const CustomText(
          text: "Modify Project",
          size: 20,
          color: Color(0xffffffff),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                final formKey = GlobalKey<FormState>();
                if (formKey.currentState?.validate() == true) {
                  // go to endpoint logic
                }
              },
              icon: const Icon(Icons.done, color: Color(0xffffffff)),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: EditProjectBody(),
      ),
    );
  }
}

class EditProjectBody extends StatelessWidget {
  const EditProjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    final picker = ImagePicker();
    File? presentation;
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const ProfileImageSection(),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const BasicInformation(),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const ProjectImagesSection(),
              const Divider(),
              const SizedBox(height: 10),
              const ProjectLinksSection(),
              const Divider(),
              const SizedBox(height: 10),
              const ProjectPresentationSection(),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const ProjectMembersSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/defualt_img.png"),
        ),
        Center(
          child: CustomText(
            text: 'Tap to Change Logo',
            size: 12,
            color: Color(0xff848484),
          ),
        ),
      ],
    );
  }
}

class BasicInformation extends StatelessWidget {
  const BasicInformation({super.key});

  @override
  Widget build(BuildContext context) {
    DateTimeRange? rangeValue;
    DateTime? presentationDate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Base Information',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        CustomTextFormField(label: 'Project name', hintText: 'Project name'),
        SizedBox(height: 10),
        CustomTextFormField(label: 'Bootcamp name', hintText: 'Bootcamp name'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Project Type', hintText: 'Website/app/etc...'),
        SizedBox(height: 10),
        ProjectDurationSection(
          rangeValue: rangeValue,
          onRangeSelected: (value) {
            rangeValue = value;
          },
        ),
        SizedBox(height: 10),
        PresentationDateSection(
          presentationDate: presentationDate,
          onDateSelected: (value) {
            presentationDate = value;
          },
        ),
        SizedBox(height: 10),
        const CustomTextFormField(
          label: 'Description',
          maximumLines: 5,
          hintText: '',
        ),
      ],
    );
  }
}

class ProjectDurationSection extends StatelessWidget {
  final DateTimeRange? rangeValue;
  final ValueChanged<DateTimeRange> onRangeSelected;

  const ProjectDurationSection(
      {super.key, required this.rangeValue, required this.onRangeSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Project duration',
            style: TextStyle(color: Color(0xff262626), fontSize: 16)),
        Row(
          children: [
            CustomText(
              text: rangeValue != null
                  ? rangeValue.toString()
                  : 'No date selected yet',
              size: 12,
              color: const Color(0xff848484),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RangeDatePicker(
                          centerLeadingDate: true,
                          minDate: DateTime(2020, 10, 10),
                          maxDate: DateTime(2030, 10, 30),
                          onRangeSelected: (value) {
                            onRangeSelected(value);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Change'),
            ),
          ],
        ),
      ],
    );
  }
}

class PresentationDateSection extends StatelessWidget {
  final DateTime? presentationDate;
  final ValueChanged<DateTime> onDateSelected;

  const PresentationDateSection(
      {super.key,
      required this.presentationDate,
      required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Presentation date',
            style: TextStyle(color: Color(0xff262626), fontSize: 16)),
        Row(
          children: [
            CustomText(
              text: presentationDate != null
                  ? presentationDate.toString()
                  : 'No date selected yet',
              size: 12,
              color: const Color(0xff848484),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DatePicker(
                          centerLeadingDate: true,
                          minDate: DateTime(2020, 10, 10),
                          maxDate: DateTime(2030, 10, 30),
                          onDateSelected: (value) {
                            onDateSelected(value);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Change'),
            ),
          ],
        ),
      ],
    );
  }
}

class ProjectImagesSection extends StatelessWidget {
  const ProjectImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();
    final picker = ImagePicker();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modify Projects Images',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () async {
                final pickedFiles = await picker.pickMultiImage(
                  imageQuality: 100,
                  maxHeight: 1000,
                  maxWidth: 1000,
                );

                if (pickedFiles != null && pickedFiles.isNotEmpty) {
                  for (var file in pickedFiles) {
                    bloc.imgList.add(File(file.path));
                  }
                  bloc.add(EditImagesEvent(imgs: bloc.imgList));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Nothing is selected')));
                }
              },
              child: const Text('Add Images'),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: BlocBuilder<EditProjectBloc, EditProjectState>(
            builder: (context, state) {
              if (bloc.imgList.isNotEmpty) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bloc.imgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 150,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRect(
                              child: kIsWeb
                                  ? Image.network(
                                      bloc.imgList[index].path,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Center(
                                        child: Text('Error loading image'),
                                      ),
                                    )
                                  : Image.file(
                                      bloc.imgList[index],
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Center(
                                        child: Text('Error loading image'),
                                      ),
                                    ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Color(0xffFF8182)),
                              onPressed: () {
                                bloc.add(DeleteImagesEvent(imgsInt: index));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CustomText(
                  text: 'No images selected',
                  size: 12,
                  color: Color(0xff848484),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProjectLinksSection extends StatelessWidget {
  const ProjectLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects Links',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Github url', hintText: 'https://github.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Figma url', hintText: 'https://Figma.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Youtube url', hintText: 'https://Youtube.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Pinterest url', hintText: 'https://Pinterest.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Playstore url', hintText: 'https://app.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Appstore url', hintText: 'https://app.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'APK url', hintText: 'https://app.com/example'),
        SizedBox(height: 10),
        CustomTextFormField(
            label: 'Web url', hintText: 'https://app.com/example'),
      ],
    );
  }
}

class ProjectPresentationSection extends StatelessWidget {
  const ProjectPresentationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Projects Presentation',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  final presentation = File(result.files.single.path!);
                  bloc.add(UpdateFileEvent(presentation: presentation));
                }
              },
              child: const Text('Upload'),
            ),
          ],
        ),
        BlocBuilder<EditProjectBloc, EditProjectState>(
          builder: (context, state) {
            if (bloc.presention.path.isNotEmpty) {
              return Center(
                child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff4E2EB5))),
                    child: PdfView(path: bloc.presention.path)),
              );
            }
            return const Center(
              child: CustomText(
                text: 'No file selected',
                size: 12,
                color: Color(0xff848484),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ProjectMembersSection extends StatelessWidget {
  const ProjectMembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modify Projects Members',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        BlocBuilder<EditProjectBloc, EditProjectState>(
          builder: (context, state) {
            if (bloc.members.isNotEmpty) {
              return Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text("Member's Name",
                            style: TextStyle(
                                color: Color(0xff262626), fontSize: 16)),
                      ),
                      Expanded(
                        child: Text("Member's Role",
                            style: TextStyle(
                                color: Color(0xff262626), fontSize: 16)),
                      ),
                    ],
                  ),
                  for (int i = 0; i < bloc.members.length; i++)
                    MemberRow(index: i),
                ],
              );
            }
            return const Center(
              child: CustomText(
                text: 'No members added',
                size: 12,
                color: Color(0xff848484),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                bloc.add(AddMembersEvent());
              },
              child: const Text("Add A Member"),
            ),
          ],
        ),
      ],
    );
  }
}

class MemberRow extends StatelessWidget {
  final int index;

  const MemberRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: "Member's Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onChange: (value) {
              bloc.add(UpdateMembersEvent(
                index: index,
                id: value!,
                role: bloc.members[index]['role']!,
              ));
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextFormField(
            hintText: "Member's Role",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a role';
              }
              return null;
            },
            onChange: (value) {
              bloc.add(UpdateMembersEvent(
                index: index,
                id: bloc.members[index]['id']!,
                role: value!,
              ));
            },
          ),
        ),
        IconButton(
          onPressed: () {
            bloc.add(DeleteMembersEvent(index: index));
          },
          icon: const Icon(Icons.delete, color: Color(0xffFF8182)),
        ),
      ],
    );
  }
}
