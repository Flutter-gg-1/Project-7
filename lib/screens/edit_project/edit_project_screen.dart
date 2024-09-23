import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/custom_elevated_button.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/screens/edit_project/bloc/edit_project_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/setup/init_setup.dart';

class EditProjectScreen extends StatelessWidget {
  final String projectId;

  const EditProjectScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProjectBloc(),
      child: EditProjectForm(
        projectId: projectId,
      ),
    );
  }
}

class EditProjectForm extends StatelessWidget {
  final String projectId;
  const EditProjectForm({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    ApiNetowrok api = ApiNetowrok();
    final formKey = GlobalKey<FormState>();
    final bloc = context.read<EditProjectBloc>();
    bloc.id = projectId;
    return Scaffold(
      backgroundColor: const Color(0xffFBFBFB),
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
                if (formKey.currentState?.validate() == true) {
                  //go to api methods

                  if (bloc.logoImg == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a logo image.'),
                        backgroundColor: Color(0xff4D2EB4),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else if (bloc.duration ==
                      DateTimeRange(
                          start: bloc.dateFormat.parse('0000-00-00'),
                          end: bloc.dateFormat.parse('0000-00-00'))) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Choose Project duration.'),
                        backgroundColor: Color(0xff4D2EB4),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else if (bloc.presentationDate ==
                      bloc.dateFormat.parse('0000-00-00')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Choose Presentation date.'),
                        backgroundColor: Color(0xff4D2EB4),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    api.updateProject(
                        projectID: projectId,
                        token: getIt.get<DataLayer>().authUser!.token,
                        name: bloc.name,
                        bootcamp: bloc.bootcampName,
                        type: bloc.type,
                        start: DateFormat('dd/MM/yyyy')
                            .format(bloc.duration!.start),
                        end:
                            DateFormat('dd/MM/yyyy').format(bloc.duration!.end),
                        presentationDate: DateFormat('dd/MM/yyyy')
                            .format(bloc.presentationDate!),
                        desc: bloc.description,
                        link: bloc.links!,
                        logo: bloc.logoImg!.path,
                        members: bloc.members!,
                        imagesList: bloc.imgList);
                  }
                }
              },
              icon: const Icon(Icons.done, color: Color(0xffffffff)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: EditProjectBody(formKey: formKey),
      ),
    );
  }
}

class EditProjectBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const EditProjectBody({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const ProjectLogoSection(),
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
              const SizedBox(height: 10),
              if (getIt.get<DataLayer>().userInfo!.role != 'user')
                CustomElevatedButton(
                  backgroundColor: const Color(0xff4D2EB4),
                  text: 'Delete This Project',
                  textcolor: const Color(0xffffffff),
                  onPressed: () {
                    // alert msg
                    // api delete method
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

// --------------- edit logo --------------------
class ProjectLogoSection extends StatelessWidget {
  const ProjectLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();
    final picker = ImagePicker();

    return Column(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              bloc.add(UpdateLogoEvent(logo: File(image.path)));
            }
          },
          child: BlocBuilder<EditProjectBloc, EditProjectState>(
            builder: (context, state) {
              return CircleAvatar(
                radius: 40,
                backgroundImage: bloc.logoImg != null
                    ? FileImage(bloc.logoImg!)
                    : const AssetImage("assets/images/default_img.png")
                        as ImageProvider,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: CustomText(
            text: 'Tap to Change Logo',
            size: 12,
            color: Color(0xff848484),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// --------------- edit base info --------------------

class BasicInformation extends StatelessWidget {
  const BasicInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();
    TextEditingController? nameController =
        TextEditingController(text: bloc.name);
    TextEditingController? bootcampController =
        TextEditingController(text: bloc.bootcampName);
    TextEditingController? typeController =
        TextEditingController(text: bloc.type);
    TextEditingController? descController =
        TextEditingController(text: bloc.description);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Base Information',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Project name',
          hintText: 'Project name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Project name';
            }
            return null;
          },
          controller: nameController,
          onChange: (value) {
            bloc.name = nameController.text;
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Bootcamp name',
          hintText: 'Bootcamp Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Bootcamp Name';
            }
            return null;
          },
          controller: bootcampController,
          onChange: (value) {
            bloc.bootcampName = bootcampController.text;
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Project Type',
          hintText: 'Website/app/etc...',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Project Type';
            }
            return null;
          },
          controller: typeController,
          onChange: (value) {
            bloc.type = typeController.text;
            return null;
          },
        ),
        const SizedBox(height: 10),
        ProjectDurationSection(
          onRangeSelected: (value) {},
        ),
        const SizedBox(height: 10),
        PresentationDateSection(
          onDateSelected: (value) {},
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Description',
          maximumLines: 5,
          hintText: '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Description';
            }
            return null;
          },
          controller: descController,
          onChange: (value) {
            bloc.description = descController.text;
            return null;
          },
        ),
      ],
    );
  }
}

// --------------- edit duration --------------------

class ProjectDurationSection extends StatelessWidget {
  final ValueChanged<DateTimeRange> onRangeSelected;

  const ProjectDurationSection({super.key, required this.onRangeSelected});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Project Duration',
          style: TextStyle(color: Color(0xff262626), fontSize: 16),
        ),
        Row(
          children: [
            BlocBuilder<EditProjectBloc, EditProjectState>(
              builder: (context, state) {
                return CustomText(
                  text: bloc.duration !=
                          DateTimeRange(
                              start: bloc.dateFormat.parse('0000-00-00'),
                              end: bloc.dateFormat.parse('0000-00-00'))
                      ? '${DateFormat('MM/dd/yyyy').format(bloc.duration!.start)} - ${DateFormat('MM/dd/yyyy').format(bloc.duration!.end)}'
                      : 'No dates selected yet',
                  size: 12,
                  color: const Color(0xff848484),
                );
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RangeDatePicker(
                              selectedRange: bloc.startDateFromDB == null &&
                                      bloc.endDateFromDB == null
                                  ? null
                                  : bloc.duration,
                              centerLeadingDate: true,
                              minDate: DateTime(2020, 10, 10),
                              maxDate: DateTime(2030, 10, 30),
                              onRangeSelected: (value) {
                                onRangeSelected(value);
                                bloc.duration = value;
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomElevatedButton(
                              backgroundColor: const Color(0xff4E2EB5),
                              text: 'Confirm',
                              textcolor: const Color(0xffffffff),
                              onPressed: () {
                                if (bloc.duration != null) {
                                  bloc.add(UpdateProjectDurationEvent(
                                      date: bloc.duration!));
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
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

// --------------- edit presentation date --------------------

class PresentationDateSection extends StatelessWidget {
  final ValueChanged<DateTime> onDateSelected;

  const PresentationDateSection({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Presentation date',
          style: TextStyle(color: Color(0xff262626), fontSize: 16),
        ),
        Row(
          children: [
            BlocBuilder<EditProjectBloc, EditProjectState>(
              builder: (context, state) {
                return CustomText(
                  text: bloc.presentationDate !=
                          bloc.dateFormat.parse('0000-00-00')
                      ? '${bloc.presentationDate!.month.toString().padLeft(2, '0')}/${bloc.presentationDate!.day.toString().padLeft(2, '0')}/${bloc.presentationDate!.year}'
                      : 'No date selected yet',
                  size: 12,
                  color: const Color(0xff848484),
                );
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DatePicker(
                              centerLeadingDate: true,
                              selectedDate: bloc.presentationDateFromDB == null
                                  ? null
                                  : bloc.presentationDate,
                              minDate: DateTime(2020, 10, 10),
                              maxDate: DateTime(2030, 10, 30),
                              onDateSelected: (value) {
                                bloc.presentationDate =
                                    value; // Store the selected date
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomElevatedButton(
                              backgroundColor: const Color(0xff4E2EB5),
                              text: 'Confirm',
                              textcolor: const Color(0xffffffff),
                              onPressed: () {
                                if (bloc.presentationDate != null) {
                                  bloc.add(UpdatePresentationDateEvent(
                                      date: bloc.presentationDate!));
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
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

// --------------- edit imgs --------------------

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

                if (pickedFiles.isNotEmpty) {
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

// --------------- edit links --------------------
class ProjectLinksSection extends StatelessWidget {
  const ProjectLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    // Initialize controllers
    TextEditingController githubController = TextEditingController();
    TextEditingController figmaController = TextEditingController();
    TextEditingController youtubeController = TextEditingController();
    TextEditingController pinterestController = TextEditingController();
    TextEditingController playstoreController = TextEditingController();
    TextEditingController appstoreController = TextEditingController();
    TextEditingController apkController = TextEditingController();
    TextEditingController webController = TextEditingController();

    // Map links to controllers
    for (var link in bloc.links!) {
      switch (link['type']) {
        case 'github':
          githubController.text = link['url'] ?? '';
          break;
        case 'figma':
          figmaController.text = link['url'] ?? '';
          break;
        case 'video':
          youtubeController.text = link['url'] ?? '';
          break;
        case 'pinterest':
          pinterestController.text = link['url'] ?? '';
          break;
        case 'playstore':
          playstoreController.text = link['url'] ?? '';
          break;
        case 'applestore':
          appstoreController.text = link['url'] ?? '';
          break;
        case 'apk':
          apkController.text = link['url'] ?? '';
          break;
        case 'weblink':
          webController.text = link['url'] ?? '';
          break;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Projects Links',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Github url',
          hintText: 'https://github.com/example',
          controller: githubController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(github: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Figma url',
          hintText: 'https://Figma.com/example',
          controller: figmaController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(figma: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Youtube url',
          hintText: 'https://Youtube.com/example',
          controller: youtubeController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(video: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Pinterest url',
          hintText: 'https://Pinterest.com/example',
          controller: pinterestController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(pinterest: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Playstore url',
          hintText: 'https://app.com/example',
          controller: playstoreController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(playstore: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Appstore url',
          hintText: 'https://app.com/example',
          controller: appstoreController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(applestore: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'APK url',
          hintText: 'https://app.com/example',
          controller: apkController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(apk: value));
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Web url',
          hintText: 'https://app.com/example',
          controller: webController,
          onChange: (value) {
            bloc.add(UpdateLinksEvent(web: value));
            return null;
          },
        ),
      ],
    );
  }
}

// --------------- edit presentation file --------------------

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
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff4E2EB5))),
                    child: Text("hiiiiii")),
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

// --------------- edit members --------------------

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
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<EditProjectBloc, EditProjectState>(
          builder: (context, state) {
            if (bloc.members!.isNotEmpty) {
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
                  for (int i = 0; i < bloc.members!.length; i++)
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
    TextEditingController memberIdController = TextEditingController();
    TextEditingController memberRoleController = TextEditingController();

    memberIdController.text = bloc.members?[index].id ?? '';

    memberRoleController.text = bloc.members?[index].position ?? '';

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: memberIdController,
                hintText: "Member's ID",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter ID';
                  }
                  return null;
                },
                onChange: (value) {
                  bloc.add(UpdateMembersEvent(
                    index: index,
                    id: value!,
                    role: bloc.members![index].position!,
                  ));
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextFormField(
                controller: memberRoleController,
                hintText: "Member's Role",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a role';
                  }
                  return null;
                },
                onChange: (value) {
                  bloc.add(UpdateMembersEvent(
                    index: index,
                    id: bloc.members![index].id!,
                    role: value!,
                  ));
                  return null;
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
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
