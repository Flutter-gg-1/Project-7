part of 'edit_project_screen.dart';

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
