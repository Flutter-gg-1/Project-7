part of 'edit_project_screen.dart';


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
