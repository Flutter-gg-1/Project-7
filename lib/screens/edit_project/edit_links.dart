part of 'edit_project_screen.dart';


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
