part of 'edit_project_screen.dart';

// --------------- edit members --------------------

class ProjectMembersSection extends StatelessWidget {
  const ProjectMembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modify Project Members',
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
                        child: Text("Member's ID",
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

class MemberRow extends StatefulWidget {
  final int index;

  const MemberRow({super.key, required this.index});

  @override
  _MemberRowState createState() => _MemberRowState();
}

class _MemberRowState extends State<MemberRow> {
  late TextEditingController memberIdController;
  late TextEditingController memberRoleController;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<EditProjectBloc>();
    memberIdController =
        TextEditingController(text: bloc.members?[widget.index].id ?? '');
    memberRoleController =
        TextEditingController(text: bloc.members?[widget.index].position ?? '');
  }

  @override
  void dispose() {
    memberIdController.dispose();
    memberRoleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProjectBloc>();

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
                    index: widget.index,
                    id: value,
                    role: bloc.members![widget.index].position!,
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
                    index: widget.index,
                    id: bloc.members![widget.index].id!,
                    role: value,
                  ));
                  return null;
                },
              ),
            ),
            IconButton(
              onPressed: () {
                bloc.add(DeleteMembersEvent(index: widget.index));
              },
              icon: const Icon(Icons.delete, color: Color(0xffFF8182)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
