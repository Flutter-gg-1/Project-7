part of 'edit_project_screen.dart';

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
