import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuwaiq_project_pulse/extensions/string_ex.dart';
import 'package:tuwaiq_project_pulse/reusable_components/cards/bordered_card_view.dart';
import 'package:tuwaiq_project_pulse/reusable_components/popups/animated_snackbar.dart';
import 'package:tuwaiq_project_pulse/reusable_components/popups/custom_popup_view.dart';
import 'package:tuwaiq_project_pulse/screens/profile/profile_cubit.dart';

import '../../../extensions/color_ext.dart';
import '../../../reusable_components/list_item_view.dart';
import '../../../utils/typedefs.dart';

class ShowProfileView extends StatelessWidget {
  const ShowProfileView({super.key, required this.cubit});
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileIdCopiedState) {
            animatedSnakbar(msg: 'ID copied to clipboard').show(context);
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _ProfileCardView(cubit),
            ),
            Expanded(
              child: ListView(children: [
                ListItemView(label: 'Account', callback: cubit.toggleIsEdit),
                ListItemView(
                  label: 'Resume',
                  callback: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomPopupView(
                          title: "Resume",
                          child: Text("data"),
                          callback: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                ),
                const ListItemView(label: 'Projects'),
                ListItemView(
                    label: 'Logout', callback: () => cubit.logOut(context)),
              ]),
            ),
          ],
        ));
  }
}

class _ProfileCardView extends StatelessWidget {
  const _ProfileCardView(this.cubit);
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        BorderedCardView(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipOval(
                    child: cubit.user.imageUrl == null
                        ? const Placeholder()
                        : Image.network(
                            cubit.user.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              )),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${cubit.user.firstName ?? '?'} ${cubit.user.lastName ?? '?'}')
                            .styled(weight: FW.bold),
                        Text(cubit.user.id ?? '?')
                            .styled(size: 10, weight: FW.w400),
                        Text(cubit.user.email ?? '?')
                            .styled(size: 10, weight: FW.w400),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.doc_on_clipboard_fill,
                        color: C.primary,
                      ),
                      onPressed: () {
                        cubit.copyIdToClipboard();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BR.circular(24),
            side: const BorderSide(color: C.primary, width: 1),
          ),
          borderOnForeground: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child:
                Text(cubit.user.role ?? '?').styled(size: 12, weight: FW.bold),
          ),
        ),
      ],
    );
  }
}
