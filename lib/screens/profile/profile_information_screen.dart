// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/screens/profile/cubit_profile/profile_cubit.dart';
import 'package:tuwaiq_project/screens/profile/cv_handle_cubit/cv_handle_cubit.dart';
import 'package:tuwaiq_project/screens/profile/img_handle_cubit/img_handle_cubit.dart';
import 'package:tuwaiq_project/screens/profile/update_cubit/update_cubit.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/dilog/dilog_profile.dart';
import 'package:tuwaiq_project/widget/links_profile/custome_links_profile.dart';
import 'package:tuwaiq_project/widget/links_profile/custome_title_text_profile.dart';
import 'package:tuwaiq_project/widget/textformfeild/custome_text_field_profile.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  State<ProfileInformationScreen> createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  final language = languageLocaitor.get<LanguageLayer>();

  TextEditingController firstNameCon = TextEditingController();
  TextEditingController lastNameCon = TextEditingController();
  TextEditingController linkCon = TextEditingController();
  TextEditingController gitCon = TextEditingController();
  TextEditingController bidingCon = TextEditingController();

  @override
  void initState() {
    context
        .read<ImgHandleCubit>()
        .convortImgUrl(imgUrl: widget.profileModel.imageFile);

    context
        .read<CvHandleCubit>()
        .cvfileConvort(cvUrl: widget.profileModel.resumeFile);

    firstNameCon.text = widget.profileModel.firstName;
    lastNameCon.text = widget.profileModel.lastName;
    linkCon.text = widget.profileModel.link.linkedin ?? "";
    gitCon.text = widget.profileModel.link.github ?? "";
    bidingCon.text = widget.profileModel.link.bindlink ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(),
      child: Builder(builder: (context) {
        return BlocListener<UpdateCubit, UpdateState>(
          listener: (context, state) {
            if (state is UpdateLodaingState) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )));
            }
            if (state is UpdateErorrState) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.msg,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red,
              ));
            }

            if (state is GoodState) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "updated",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.green,
              ));

              context.read<ProfileCubit>().getProfile();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(context.getWidth(multiply: 1),
                        context.getHeight(multiply: 0.1)),
                    painter: AuthShape(),
                  ),
                  BlocBuilder<ImgHandleCubit, ImgHandleState>(
                    builder: (context, state) {
                      if (state is ImageHereState) {
                        return Badge(
                          alignment: AlignmentGeometry.lerp(
                              Alignment.centerLeft, Alignment.topRight, 0.6),
                          smallSize: 10,
                          backgroundColor: Colors.transparent,
                          label: IconButton(
                              onPressed: () {
                                context.read<ImgHandleCubit>().imageDel();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          child: Container(
                            height: context.getHeight(multiply: 0.19),
                            width: context.getWidth(multiply: 0.19),
                            decoration: const BoxDecoration(
                                color: Color(0xffCACACA),
                                shape: BoxShape.circle),
                            child:
                                Image.memory(Uint8List.fromList(state.imgFile)),
                          ),
                        );
                      }
                      return Badge(
                        alignment: AlignmentGeometry.lerp(
                            Alignment.centerLeft, Alignment.topRight, 0.6),
                        smallSize: 10,
                        backgroundColor: Colors.transparent,
                        label: IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? imgFile = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (imgFile != null) {
                                final bytes = await imgFile.readAsBytes();
                                context.read<ImgHandleCubit>().imageAdd(bytes);
                              }
                            },
                            icon: const FaIcon(FontAwesomeIcons.camera)),
                        child: Container(
                          height: context.getHeight(multiply: 0.19),
                          width: context.getWidth(multiply: 0.19),
                          decoration: const BoxDecoration(
                              color: Color(0xffCACACA), shape: BoxShape.circle),
                          child:
                              Image.asset('assets/image/Search-amico(1).png'),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${widget.profileModel.firstName} ${widget.profileModel.lastName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.profileModel.email,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomeTitleText(
                    isArabic: language.isArabic,
                    title: language.isArabic ? 'الاسم الاول' : 'First Name',
                  ),
                  CustomeTextFormProfile(
                    contentText: widget.profileModel.firstName,
                    controller: firstNameCon,
                    hint: language.isArabic ? 'الاسم الاول' : 'First Name',
                    isArabic: language.isArabic,
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.035),
                  ),
                  CustomeTitleText(
                    isArabic: language.isArabic,
                    title: language.isArabic ? 'الاسم الاخير' : 'Last Name',
                  ),
                  CustomeTextFormProfile(
                    contentText: widget.profileModel.lastName,
                    controller: lastNameCon,
                    hint: language.isArabic ? 'الاسم الاخير' : 'Last Name',
                    isArabic: language.isArabic,
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.035),
                  ),
                  CustomeTitleText(
                    isArabic: language.isArabic,
                    title: language.isArabic ? 'السيرة الذاتية' : 'CV',
                  ),
                  Container(
                    width: context.getWidth(multiply: 0.9),
                    height: context.getHeight(multiply: 0.08),
                    decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(6)),
                    child: BlocBuilder<CvHandleCubit, CvHandleState>(
                      builder: (context, state) {
                        if (state is CvHereState) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: context.getWidth(multiply: 0.005),
                                top: context.getWidth(multiply: 0.015)),
                            child: ListTile(
                              leading: Text(
                                state.cvName,
                                style: const TextStyle(fontSize: 16),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    context.read<CvHandleCubit>().cvDel();
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(
                              left: context.getWidth(multiply: 0.005),
                              top: context.getWidth(multiply: 0.015)),
                          child: ListTile(
                            leading: language.isArabic
                                ? IconButton(
                                    onPressed: () async {
                                      final fileData =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf'],
                                      );

                                      if (fileData != null) {
                                        final file = fileData.files.first;
                                        final bytes = file.xFile;
                                        final fileName = file.name;

                                        context.read<CvHandleCubit>().cvAdd(
                                            await bytes.readAsBytes(),
                                            fileName.substring(0, 5));
                                      }
                                    },
                                    icon: const Icon(FontAwesomeIcons.plus))
                                : Text(
                                    language.isArabic
                                        ? "لا يوجد ملفات"
                                        : "no file",
                                    style: const TextStyle(fontSize: 16)),
                            trailing: language.isArabic
                                ? const Text("لا يوجد ملفات",
                                    style: TextStyle(fontSize: 16))
                                : IconButton(
                                    onPressed: () async {
                                      final fileData =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf'],
                                      );

                                      if (fileData != null) {
                                        final file = fileData.files.first;
                                        final bytes = file.xFile;
                                        final fileName = file.name;

                                        context.read<CvHandleCubit>().cvAdd(
                                            await bytes.readAsBytes(),
                                            fileName.substring(0, 5));
                                      }
                                    },
                                    icon: const Icon(FontAwesomeIcons.plus)),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.035),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomeLinksProfile(
                        iconLinks: const FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Colors.white,
                        ),
                        onTap: () {
                          dialog(
                              context: context,
                              onDone: () {},
                              controller: linkCon);
                        },
                      ),
                      CustomeLinksProfile(
                        iconLinks: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                        onTap: () {
                          dialog(
                              context: context,
                              onDone: () {},
                              controller: gitCon);
                        },
                      ),
                      CustomeLinksProfile(
                        iconLinks: const FaIcon(
                          FontAwesomeIcons.discord,
                          color: Colors.white,
                        ),
                        onTap: () {
                          dialog(
                              context: context,
                              onDone: () {},
                              controller: bidingCon);
                        },
                      ),
                      CustomeLinksProfile(
                        text: 'CV',
                        onTap: () {
                          dialog(
                              context: context,
                              onDone: () {},
                              controller: TextEditingController());
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.035),
                  ),
                  CustomButton(
                    onPressed: () {
                      context.read<UpdateCubit>().updateProfile(
                          firstName: firstNameCon.text,
                          lastName: lastNameCon.text,
                          bindLink: bidingCon.text,
                          linkedinLink: linkCon.text,
                          githubLink: gitCon.text,
                          imgCubitFile:
                              context.read<ImgHandleCubit>().imgCubitFile,
                          cvFile: context.read<CvHandleCubit>().cvCubitFile);
                    },
                    arabicTitle: 'تعديل',
                    englishTitle: 'Update',
                    arabic: language.isArabic,
                  ),
                  SizedBox(
                    height: context.getHeight(multiply: 0.035),
                  ),
                ],
              ),
            )),
          ),
        );
      }),
    );
  }
}
