part of 'edit_project_screen.dart';

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
